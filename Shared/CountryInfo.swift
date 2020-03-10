//
//  CountryInfo.swift
//  Coronacheck
//
//  Created by Julian Schiavo on 30/1/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import Foundation

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

struct RegionInfo: Identifiable {
    var id: String { region.name }
    let region: Region
    let countries: [CountryInfo]
    var totalInfectionCount: Int { countries.map { $0.infectionCount }.reduce(0, +) }
}

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
