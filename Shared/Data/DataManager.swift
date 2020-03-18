//
//  DataManager.swift
//  Coronacheck
//
//  Created by Julian Schiavo on 30/1/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import Foundation

/// A singleton that loads and prepares data from the data source to
/// be used in the rest of the app.
class DataManager: ObservableObject {
    
    enum DataManagerError: Error {
        case failedToLoad
        
        var localizedDescription: String {
            switch self {
            case .failedToLoad: return "Failed to load data."
            }
        }
    }
    
    // Properties containing the final data after loading and preparation
    @Published var regionInfos = [RegionInfo]()
    @Published var expandedRegions = [Region]()
    @Published var currentCaseDifference = 0
    
    var currentDataSource: DataSource {
        DataSourcePreference().current
    }
    
    private var baseURL: URL
    
    // MARK: - Status
    
    enum Status {
        case fetchStarting(URL)
        case fetchSuccessful(URL)
        case fetchFailed(URL, Error?)
        case decodeSuccessful
        case decodeFailed(URL?, Error?)
        case custom(String)
    }
    
    static func request(ofType type: String, didChangeStatus status: Status) {
        switch status {
        case let .fetchStarting(url):
            print("Starting \(type) request with URL:", url)
        case let .fetchSuccessful(url):
            print("\(type) request (URL: \(url)) finished successfully")
        case let .fetchFailed(url, error):
            print("\(type) request (URL: \(url)) failed with error:", error as Any)
        case .decodeSuccessful:
            print("\(type) decoding finished successfully")
        case let .decodeFailed(url, error):
            print("\(type) decoding failed with URL:", url ?? "", "and error:", error as Any)
        case let .custom(text):
            print("\(type) \(text)")
        }
    }
    
    // MARK: - Data
    
    /// An object containing all of the info together, used to display info about the worldwide cases
    var overallCountry: CountryInfo {
        let infectionCount = regionInfos.flatMap { $0.countries }.map { $0.infectionCount }.reduce(0, +)
        let deathCount = regionInfos.flatMap { $0.countries }.map { $0.deathCount }.reduce(0, +)
        let recoveredCount = regionInfos.flatMap { $0.countries }.map { $0.recoveredCount }.reduce(0, +)
        
        return CountryInfo(name: "Overall", data: .overall, infectionCount: infectionCount, deathCount: deathCount, recoveredCount: recoveredCount, difference: currentCaseDifference, lastUpdated: "", comments: "")
    }
    
    func updateData() {
        currentDataSource.fetchData { result in
            switch result {
            case let .success(regionInfos):
                self.regionInfos = regionInfos
                self.updateDifferenceData()
            case let .failure(error):
                print("Failed to update data with error", error.localizedDescription)
            }
        }
    }
    
    // MARK: - Region Expansion
    
    var areAllRegionsExpanded: Bool {
        expandedRegions == Region.allCases
    }
    
    func toggleAllRegionsExpanded() {
        if areAllRegionsExpanded {
            expandedRegions = []
        } else {
            expandedRegions = Region.allCases
        }
    }
    
    func toggleRegionExpansion(region: Region) {
        if expandedRegions.contains(region) {
            expandedRegions.removeAll { $0 == region }
        } else {
            expandedRegions.append(region)
        }
    }
    
    // MARK: - Case Difference
    
    private func updateDifferenceData() {
        let oldInfectionCount = UserDefaults.standard.integer(forKey: "InfectionCount")
        let oldDeathCount = UserDefaults.standard.integer(forKey: "DeathCount")
        let oldRecoveredCount = UserDefaults.standard.integer(forKey: "RecoveredCount")
        
        let infectionCount = regionInfos.flatMap { $0.countries }.map { $0.infectionCount }.reduce(0, +)
        let deathCount = regionInfos.flatMap { $0.countries }.map { $0.deathCount }.reduce(0, +)
        let recoveredCount = regionInfos.flatMap { $0.countries }.map { $0.recoveredCount }.reduce(0, +)
        
        guard oldInfectionCount != infectionCount || oldDeathCount != deathCount || oldRecoveredCount != recoveredCount else { return }
        
        UserDefaults.standard.set(infectionCount, forKey: "InfectionCount")
        UserDefaults.standard.set(deathCount, forKey: "DeathCount")
        UserDefaults.standard.set(recoveredCount, forKey: "RecoveredCount")
        
        let oldCurrentCaseCount = oldInfectionCount - oldDeathCount - oldRecoveredCount
        let newCurrentCaseCount = infectionCount - deathCount - recoveredCount
        currentCaseDifference = newCurrentCaseCount - oldCurrentCaseCount
    }
    
    // MARK: - Singleton
    
    static var shared = DataManager()
    private init() {
        let baseURLString = "https://interactive-static.scmp.com"
        guard let baseURL = URL(string: baseURLString) else {
            fatalError("Invalid base URL!")
        }
        self.baseURL = baseURL
        
        updateData()
    }
    
}
