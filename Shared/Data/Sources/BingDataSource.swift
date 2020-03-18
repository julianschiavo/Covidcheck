//
//  BingDataSource.swift
//  Covidcheck
//
//  Created by Julian Schiavo on 17/3/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import Foundation

class BingDataSource: DataSource {
    
    struct RawData: Codable {
        var areaInfos: [RawAreaInfo]
        
        var countries: [CountryInfo] {
            areaInfos.map { $0.country }
        }
        
        enum CodingKeys: String, CodingKey {
            case areaInfos = "areas"
        }
    }
    
    struct RawAreaInfo: Codable {
        var name: String
        var infectionCount: Int
        var deathCount: Int
        var recoveredCount: Int
//        var lastUpdated: String?
        
        enum CodingKeys: String, CodingKey {
            case name = "displayName"
            case infectionCount = "totalConfirmed"
            case deathCount = "totalDeaths"
            case recoveredCount = "totalRecovered"
//            case lastUpdated = "lastupdated"
        }
        
        /// Create a `CountryInfo` object from the raw data, removing illegal characters
        var country: CountryInfo {
            let countryData = CountryMapping.countryFromCountryName(name)
            
            return CountryInfo(name: name, data: countryData, infectionCount: infectionCount, deathCount: deathCount, recoveredCount: recoveredCount, lastUpdated: "", comments: "")
        }
    }
    
    enum CountryMapping {
        static func countryFromCountryName(_ countryName: String) -> CountryData? {
            let cleanedCountryName = countryName.replacingOccurrences(of: "*", with: "")
            switch cleanedCountryName {
            case "Bolivia":                         return .boliviaPlurinationalStateOf
            case "Brunei":                          return .bruneiDarussalam
            case "Republic of the Congo":           return .congo
            case "Congo (DRC)":                     return .congoDemocraticRepublicOfThe
            case "Côte d’Ivoire":                   return .coteDIvoire
            case "Vatican City":                    return .holySee
            case "Hong Kong SAR":                   return .hongKong
            case "Iran":                            return .iranIslamicRepublicOf
            case "South Korea":                     return .koreaRepublicOf
            case "Macao SAR":                       return .macao
            case "Moldova":                         return .moldovaRepublicOf
            case "Palestinian Authority":           return .palestineStateOf
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
    
    let id = "Bing"
    let name = "Microsoft/Bing"
    
    private var baseURL: URL
    
    required init() {
        let baseURLString = "https://www.bing.com"
        guard let baseURL = URL(string: baseURLString) else {
            fatalError("Invalid base URL for source Microsoft/Bing!")
        }
        self.baseURL = baseURL
    }
    
    // MARK: - Fetching
    
    /// Fetches updated data, which is then processed
    func fetchData(completion: @escaping (Result<[RegionInfo], Error>) -> Void) {
        let type = "FetchData"
        
        let url = baseURL.appendingPathComponent("/covid/data")
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
