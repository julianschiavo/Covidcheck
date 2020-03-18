//
//  RegionInfoSection.swift
//  Coronacheck
//
//  Created by Julian Schiavo on 11/3/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI

/// A section in the `RegionList` displaying the countries and their infection,
/// death, and recovered case counts using tokens. As more and more countries
/// are reporting cases, countries with less cases are hidden until expanded
/// to save space and minimize unnescessary scrolling.
struct RegionInfoSection: View {
    
    @ObservedObject private var dataManager = DataManager.shared
    
    var regionInfo: RegionInfo
    var region: Region { regionInfo.region }
    var regionName: String { region.name.uppercased() }
    var countries: [CountryInfo] { regionInfo.countries }
    
    /// The available width provided by the `RegionList` superview
    @Binding var width: CGFloat
    
    var body: some View {
        /// The minimum infection count for a country to be shown without expansion
        let minInfectionCount = regionInfo.minInfectionCount
        
        #if os(iOS)
        /// Whether to use expansion--if there aren't enough countries above the minimum infection count, all countries are displayed
        let useExpansion = countries.filter { $0.infectionCount >= minInfectionCount }.count > 3
        #else
        let useExpansion = false // Expansion is disabled on watchOS
        #endif
        
        /// Whether the region is currently expanded
        let isExpanded = dataManager.expandedRegions.contains(region)

        /// If the region is collapsed and expansion is enabled, all countries above the minimum infection count, otherwise, all countries
        let shownCountries = useExpansion && !isExpanded ? countries.filter { $0.infectionCount >= minInfectionCount } : countries
        
        return Section(header: Text(regionName)) {
            ForEach(shownCountries) { country in
                CountryRow(country: country, width: self.$width)
            }
            // Only display the expand/collapse button if expansion is enabled
            if useExpansion {
                ListButton(image: isExpanded ? Images.expandedCircle : Images.collapsedCircle,
                           text: "\(isExpanded ? "Hide" : "Show") places with below \(minInfectionCount) cases") {
                            self.dataManager.toggleRegionExpansion(region: self.region)
                }
            }
        }
    }
}

#if DEBUG

struct RegionInfoSection_Previews: PreviewProvider {
    static var previews: some View {
        let regionInfo = RegionInfo(
            region: .europe,
            countries: [
                CountryInfo(name: "Country", data: .antarctica, infectionCount: 500, deathCount: 100, recoveredCount: 50, difference: 30, lastUpdated: "", comments: ""),
                CountryInfo(name: "Additional", data: .antarctica, infectionCount: 500, deathCount: 100, recoveredCount: 50, difference: 30, lastUpdated: "", comments: "")
            ]
        )
        
        return List {
            RegionInfoSection(regionInfo: regionInfo, width: .constant(300))
        }
    }
}

#endif
