//
//  RegionList.swift
//  Coronacheck
//
//  Created by Julian Schiavo on 30/1/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI

/// The base list for the app, containing regions and countries showing
/// the amount of infections, deaths, and recovered COVID-19 cases.
struct RegionList: View {
    
    @ObservedObject private var dataManager = DataManager.shared
    
    @Binding var isRefreshAlertPresented: Bool
    
    /// Used to display tokens on each row based on the available list row width, letting us avoid tokens being cut off or wrapping text to the next line.
    @State private var width: CGFloat = 0
    
    var body: some View {
        #if os(iOS)
        let footerText = Text("Data Source: \(dataManager.currentDataSource.name)")
        #else
        let footerText = Text("") // Hide the info text on watchOS to save space
        #endif
        
        return ZStack {
            List {
                Section(footer: footerText) {
                    CountryRow(country: dataManager.overallCountry, width: self.$width)
                    ListButton(image: Images.refresh, text: "Refresh Data") {
                        self.isRefreshAlertPresented.toggle()
                        DataManager.shared.updateData()
                    }
                }
                ForEach(dataManager.regionInfos) { regionInfo in
                    RegionInfoSection(regionInfo: regionInfo, width: self.$width)
                }
                Text("Created by Julian Schiavo.")
                    .foregroundColor(.gray)
                    .font(.footnote)
            }
            .animation(.easeInOut)
            
            // On initial app load, an empty list is displayed briefly to calculate the width of the list. This allows us to calculate token display based on available width.
            if width < 1 {
                List {
                    WidthRetriever()
                }
            }
        }
        .onPreferenceChange(WidthPreferenceKey.self) {
             // When the width is updated by the invisible list, update the actual available width by removing space used for images and padding
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

struct CountryList_Previews: PreviewProvider {
    @State static var isRefreshAlertPresented = false
    static var previews: some View {
        RegionList(isRefreshAlertPresented: $isRefreshAlertPresented)
    }
}
