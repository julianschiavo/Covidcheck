//
//  CountryInfo.swift
//  Coronacheck
//
//  Created by Julian Schiavo on 30/1/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import Foundation

/// A model describing the raw country info received from the data source
struct RawCountryInfo: Codable {
    var name: String?
    var infections: String?
    var deaths: String?
    var recovered: String?
    var comments: String?
    var lastUpdated: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "country"
        case infections = "cases"
        case deaths
        case recovered
        case comments
        case lastUpdated = "lastupdated"
    }
    
    /// Create a `CountryInfo` object from the raw data, removing illegal characters
    var country: CountryInfo {
        let filteredInfections = infections?.removingNonNumericCharacters() ?? ""
        let infectionCount = Int(filteredInfections) ?? 0
        
        let filteredDeaths = deaths?.removingNonNumericCharacters() ?? ""
        let deathCount = Int(filteredDeaths) ?? 0
        
        let filteredRecovered = recovered?.removingNonNumericCharacters() ?? ""
        let recoveredCount = Int(filteredRecovered) ?? 0
        
        let nameFixed = name ?? ""
        let commentsFixed = comments ?? ""
        let lastUpdatedFixed = lastUpdated ?? ""
        
        return CountryInfo(name: nameFixed, infectionCount: infectionCount, deathCount: deathCount, recoveredCount: recoveredCount, lastUpdated: lastUpdatedFixed, comments: commentsFixed)
    }
}

/// A model for a region which contains multiple countries
struct RegionInfo: Identifiable {
    var id: String { region.name }
    let region: Region
    let countries: [CountryInfo]
    var totalInfectionCount: Int { countries.map { $0.infectionCount }.reduce(0, +) }
    var totalCurrentCount: Int { countries.map { $0.currentCount }.reduce(0, +) }
    
    var minInfectionCount: Int {
        let smallestMinInfectionCount = countries.filter { $0.infectionCount >= 25 }.count >= 3 ? 25 : 5
        let smallerMinInfectionCount = countries.filter { $0.infectionCount >= 50 }.count > 3 ? 50 : smallestMinInfectionCount
        let minInfectionCount = countries.filter { $0.infectionCount >= 100 }.count > 3 ? 100 : smallerMinInfectionCount
        let higherMinInfectionCount = countries.filter { $0.infectionCount >= 500 }.count > 3 ? 500 : minInfectionCount
        let highestMinInfectionCount = countries.filter { $0.infectionCount >= 1000 }.count > 3 ? 1000 : higherMinInfectionCount
        return highestMinInfectionCount
    }
}

/// A model for a country, with the amount of infections, deaths, and recovered cases
/// as well as other info where available or necessary
struct CountryInfo: Identifiable {
    var id: String { name }
    let name: String
    
    let infectionCount: Int
    let deathCount: Int
    let recoveredCount: Int
    var currentCount: Int { infectionCount - deathCount - recoveredCount }
    var difference: Int?
    
    let lastUpdated: String
    let comments: String
    
    var data: CountryData? {
        CountryData(rawValue: name) ??
            CountryData(rawValue: name.replacingOccurrences(of: "*", with: "")) ??
            CountryData(rawValue: name.replacingOccurrences(of: " ", with: ""))
    }
}
