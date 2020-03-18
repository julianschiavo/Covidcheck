//
//  SCMPDataSource.swift
//  Covidcheck
//
//  Created by Julian Schiavo on 17/3/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import Foundation

class SCMPDataSource: DataSource {
    
    struct RawData: Codable {
        var title: String
//        var lastUpdatedDate: Date
        var rawCountries: [RawCountryInfo]
        
        var countries: [CountryInfo] {
            rawCountries.map { $0.country }
        }
        
        enum CodingKeys: String, CodingKey {
            case title
//            case lastUpdatedDate = "last_updated"
            case rawCountries = "entries"
        }
    }
    
    struct RawCountryInfo: Codable {
        var name: String?
        var infectionCount: String?
        var deathCount: String?
        var recoveredCount: String?
        var comments: String?
        var lastUpdated: String?
        
        enum CodingKeys: String, CodingKey {
            case name = "country"
            case infectionCount = "cases"
            case deathCount = "deaths"
            case recoveredCount = "recovered"
            case comments
            case lastUpdated = "lastupdated"
        }
        
        /// Create a `CountryInfo` object from the raw data, removing illegal characters
        var country: CountryInfo {
            let filteredInfections = infectionCount?.removingNonNumericCharacters() ?? ""
            let infectionCount = Int(filteredInfections) ?? 0
            
            let filteredDeaths = deathCount?.removingNonNumericCharacters() ?? ""
            let deathCount = Int(filteredDeaths) ?? 0
            
            let filteredRecovered = recoveredCount?.removingNonNumericCharacters() ?? ""
            let recoveredCount = Int(filteredRecovered) ?? 0
            
            let nameFixed = name ?? ""
            let countryData = CountryMapping.countryFromCountryName(nameFixed)
            
            let commentsFixed = comments ?? ""
            let lastUpdatedFixed = lastUpdated ?? ""
            
            return CountryInfo(name: nameFixed, data: countryData, infectionCount: infectionCount, deathCount: deathCount, recoveredCount: recoveredCount, lastUpdated: lastUpdatedFixed, comments: commentsFixed)
        }
    }
    
    enum CountryMapping {
        static func countryFromCountryName(_ countryName: String) -> CountryData? {
            let cleanedCountryName = countryName.replacingOccurrences(of: "*", with: "")
            switch cleanedCountryName {
            case "Bolivia":                         return .boliviaPlurinationalStateOf
            case "Brunei":                          return .bruneiDarussalam
            case "Mainland China":                  return .china
            case "Republic of Congo":               return .congo
            case "Democratic Republic of Congo":    return .congoDemocraticRepublicOfThe
            case "Cote d'Ivoire":                   return .coteDIvoire
            case "Czech Republic":                  return .czechia
            case "Iran":                            return .iranIslamicRepublicOf
            case "South Korea":                     return .koreaRepublicOf
            case "Macau":                           return .macao
            case "Moldova":                         return .moldovaRepublicOf
            case "Occupied Palestinian territory":  return .palestineStateOf
            case "Reunion":                         return .reunion
            case "Russia":                          return .russianFederation
            case "Taiwan":                          return .taiwanProvinceOfChina
            case "Tanzania":                        return .tanzaniaUnitedRepublicOf
            case "United Kingdom":                  return .unitedKingdomOfGreatBritainAndNorthernIreland
            case "United States":                   return .unitedStatesOfAmerica
            case "Venezuela":                       return .venezuelaBolivarianRepublicOf
            case "Vietnam":                         return .vietNam
            default:
                return CountryData(rawValue: cleanedCountryName) ??
                    CountryData(rawValue: cleanedCountryName.replacingOccurrences(of: " ", with: ""))
            }
        }
    }
    
    let id = "SCMP"
    let name = "South China Morning Post"
    
    private var baseURL: URL
    
    required init() {
        let baseURLString = "https://interactive-static.scmp.com"
        guard let baseURL = URL(string: baseURLString) else {
            fatalError("Invalid base URL for source South China Morning Post!")
        }
        self.baseURL = baseURL
    }
    
    // MARK: - Fetching
    
    /// Fetches updated data, which is then processed
    func fetchData(completion: @escaping (Result<[RegionInfo], Error>) -> Void) {
        let type = "FetchData"
        
        let url = baseURL.appendingPathComponent("/sheet/wuhan/viruscases.json")
        DataManager.request(ofType: type, didChangeStatus: .fetchStarting(url))
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DataManager.request(ofType: type, didChangeStatus: .fetchFailed(url, error))
                completion(.failure(error ?? DataManager.DataManagerError.failedToLoad))
                return
            }
            DataManager.request(ofType: type, didChangeStatus: .fetchSuccessful(url))
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            do {
                let rawData = try decoder.decode(RawData.self, from: data)
                DataManager.request(ofType: type, didChangeStatus: .decodeSuccessful)
                self.processData(countries: rawData.countries, completion: completion)
            } catch {
                DataManager.request(ofType: type, didChangeStatus: .decodeFailed(url, error))
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    /// Creates and sorts the list of regions and countries from the raw data
    func processData(countries: [CountryInfo], completion: @escaping (Result<[RegionInfo], Error>) -> Void) {
        var regionInfos = [RegionInfo]()
        
        for region in Region.allCases {
            let regionCountries = countries
                .filter { $0.infectionCount > 0 }
                .filter { $0.data?.region ?? .restOfTheWorld == region }
                .sorted { $0.infectionCount > $1.infectionCount }
            let regionInfo = RegionInfo(region: region, countries: regionCountries)
            regionInfos.append(regionInfo)
        }
        
        regionInfos = regionInfos.filter { !$0.countries.isEmpty }
        regionInfos.sort { $0.totalCurrentCount > $1.totalCurrentCount }
        
        DispatchQueue.main.async {
            completion(.success(regionInfos))
        }
    }
}
