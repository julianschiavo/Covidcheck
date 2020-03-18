//
//  Source.swift
//  Covidcheck
//
//  Created by Julian Schiavo on 17/3/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import Foundation

protocol DataSource {
    var id: String { get }
    var name: String { get }
    
    init()
    func fetchData(completion: @escaping (Result<[RegionInfo], Error>) -> Void)
}
