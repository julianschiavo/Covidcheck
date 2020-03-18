//
//  CountryInfo.swift
//  Coronacheck
//
//  Created by Julian Schiavo on 30/1/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import Foundation

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
    let data: CountryData?
    
    let infectionCount: Int
    let deathCount: Int
    let recoveredCount: Int
    var currentCount: Int { infectionCount - deathCount - recoveredCount }
    var difference: Int?
    
    let lastUpdated: String
    let comments: String
}
