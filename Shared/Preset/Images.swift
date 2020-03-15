//
//  Images.swift
//  Coronacheck
//
//  Created by Julian Schiavo on 10/3/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI

/// Enum containing the images used inside this app for quicker use
/// and to avoid mistakes when typing strings.
enum Images {
    static let refresh = Image(systemName: "arrow.clockwise")
    static let info = Image(systemName: "info.circle")
    
    static let expanded = Image(systemName: "chevron.up")
    static let collapsed = Image(systemName: "chevron.down")
    static let expandedCircle = Image(systemName: "chevron.up.circle")
    static let collapsedCircle = Image(systemName: "chevron.down.circle")
    
    static let casesInfected = Image(systemName: "thermometer")
    static let casesDead = Image("dead")
    static let casesRecovered = Image(systemName: "heart")
    static let casesCurrent = Image(systemName: "clock")
    static let casesIncrease = Image(systemName: "chevron.up")
    static let casesDecrease = Image(systemName: "chevron.down")
}
