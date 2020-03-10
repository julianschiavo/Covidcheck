//
//  CountryList.swift
//  Coronacheck
//
//  Created by Julian Schiavo on 30/1/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI

struct WidthPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        let newValue = nextValue()
        if newValue > 0 {
            print("YAY", newValue)
            value = newValue
        }
    }
}

struct WidthRetriever: View {
    var body: some View {
        GeometryReader { geometry in
            Color.red.preference(key: WidthPreferenceKey.self, value: geometry.size.width)
        }
    }
}

struct ListButton: View {
    
    var image: Image
    var text: String
    var tapGesture: () -> Void
    
    var body: some View {
        HStack(spacing: 10) {
            #if os(iOS)
            HStack { image.font(.system(size: 20)) }
                .frame(width: 30)
            Text(text)
            #endif
        }.onTapGesture(perform: tapGesture)
    }
}

struct CountryList: View {
    
    @ObservedObject private var dataManager = DataManager.shared
    
    @Binding var isRefreshAlertPresented: Bool
    
    @State private var width: CGFloat = 0
    
    var body: some View {
        #if os(iOS)
        let footerText = Text("Regions and countries are ordered by infection count. The latest update date is shown where available.\n\n")
        #else
        let footerText = Text("")
        #endif
        
        return List {
            Section(footer: footerText) {
                
                HStack {
                    CountryRow(country: dataManager.overallCountry, width: self.$width)//.background(WidthRetriever())
                    Spacer()
                }
                .background(WidthRetriever())
//                .listRowBackground(WidthRetriever())
                
//                    GeometryReader { geometry in
//                        Color.clear.preference(key: WidthPreferenceKey.self, value: geometry.size.width)
//                    }.frame(height: 1)
//                }
                
                    ListButton(image: Images.refresh, text: "Refresh Data") { }//.background(WidthRetriever())
//                    GeometryReader { geometry in
//                        Color.clear.preference(key: WidthPreferenceKey.self, value: geometry.size.width)
//                    }.frame(height: 1)
                }//.background(WidthRetriever())
                .onTapGesture {
                    self.isRefreshAlertPresented.toggle()
                    DataManager.shared.updateData()
                }
                
            }
            ForEach(dataManager.countryGroups) { countryGroup in
                CountryGroupSection(countryGroup: countryGroup, width: self.$width)
            }
            Text("Created by Julian Schiavo.")
                .foregroundColor(.gray)
                .font(.footnote)
        }
        .animation(.easeInOut)
        .onPreferenceChange(WidthPreferenceKey.self) {
            #if os(iOS)
            let imageSize: CGFloat = 20
            let imageSpacing: CGFloat = 10
            #else
            let imageSize: CGFloat = 0
            let imageSpacing: CGFloat = 0
            #endif
            let extraSpacing: CGFloat = 10
            self.width = $0 - imageSize - imageSpacing - extraSpacing
        }
    }
}

struct CountryGroupSection: View {
    
    @ObservedObject private var dataManager = DataManager.shared
    
    var countryGroup: RegionInfo
    var region: Region { countryGroup.region }
    var regionName: String { region.name.uppercased() }
    var countries: [CountryInfo] { countryGroup.countries }
    
    @Binding var width: CGFloat
    
    var body: some View {
        let smallestMinInfectionCount = countries.filter { $0.infectionCount >= 30 }.count > 3 ? 30 : 5
        let smallerMinInfectionCount = countries.filter { $0.infectionCount >= 50 }.count > 3 ? 50 : smallestMinInfectionCount
        let minInfectionCount = countries.filter { $0.infectionCount >= 100 }.count > 3 ? 100 : smallerMinInfectionCount
        
        #if os(iOS)
        let useExpansion = countries.filter { $0.infectionCount >= minInfectionCount }.count > 3
        #else
        let useExpansion = false
        #endif
        let isExpanded = dataManager.expandedRegions.contains(region)
        let shownCountries = useExpansion && !isExpanded ? countries.filter { $0.infectionCount >= minInfectionCount } : countries
        
        return Section(header: Text(regionName)) {
            ForEach(shownCountries) { country in
                CountryRow(country: country, width: self.$width)
            }
            if useExpansion {
                ListButton(image: isExpanded ? Images.expandedCircle : Images.collapsedCircle,
                           text: "\(isExpanded ? "Hide" : "Show") places without many infections") {
                    if isExpanded {
                        self.dataManager.expandedRegions.removeAll { $0 == self.region }
                    } else {
                        self.dataManager.expandedRegions.append(self.region)
                    }
                }
            }
        }
    }
}

struct CountryList_Previews: PreviewProvider {
    @State static var isRefreshAlertPresented = false
    static var previews: some View {
        CountryList(isRefreshAlertPresented: $isRefreshAlertPresented)
    }
}
