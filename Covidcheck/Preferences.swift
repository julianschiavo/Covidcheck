//
//  Preferences.swift
//  Covidcheck
//
//  Created by Julian Schiavo on 18/3/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import Foundation

enum PreferenceType {
    case boolean
    case picker
}

protocol Preference {
    var type: PreferenceType { get }
    var id: String { get }
    var name: String { get }
    var value: String { get }
    var pickerOptions: [String: String] { get }
    
    func `switch`(to: String?)
}

struct DataSourcePreference: Preference {
    let dataSources: [String: DataSource.Type] = ["SCMP": SCMPDataSource.self, "Bing": BingDataSource.self]
    let defaultID = "Bing"
    
    let type = PreferenceType.picker
    
    let id = "DataSource"
    let name = "Data Source"
    
    var value: String {
        current.name
    }
    
    var current: DataSource {
        let id = UserDefaults.standard.string(forKey: "CurrentDataSource") ?? defaultID
        guard let dataSource = dataSources[id] ?? dataSources[defaultID] else {
            fatalError("Unknown data source ID")
        }
        return dataSource.init()
    }
    
    var pickerOptions: [String: String] {
        let array = dataSources.mapValues { $0.init().name }.map { ($0.value, $0.key) }
        return Dictionary(uniqueKeysWithValues: array)
    }
    
    func `switch`(to id: String?) {
        UserDefaults.standard.set(id ?? defaultID, forKey: "CurrentDataSource")
        DataManager.shared.updateData()
    }
}
