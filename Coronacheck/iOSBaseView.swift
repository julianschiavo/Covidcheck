//
//  iOSBaseView.swift
//  Coronacheck
//
//  Created by Julian Schiavo on 8/3/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI

struct BaseView: View {
    
    @ObservedObject private var dataManager = DataManager.shared
    
    @State private var isRefreshAlertPresented = false
    @State private var isExpandAlertPresented = false
    
    var allRegionExpansionAlertText: Text {
        Text(dataManager.areAllRegionsExpanded ? "All Regions Expanded" : "All Regions Collapsed")
    }
    
    var expandAllRegionsButtonImage: Image {
        dataManager.areAllRegionsExpanded ? Images.expanded : Images.collapsed
    }
    
    var expandAllRegionsButton: Button<Image> {
        Button(action: {
            self.dataManager.toggleAllRegionsExpanded()
            self.isExpandAlertPresented.toggle()
        }, label: {
            expandAllRegionsButtonImage
        })
    }
    
    var refreshDataButton: Button<Image> {
        Button(action: {
            self.isRefreshAlertPresented.toggle()
            DataManager.shared.updateData()
        }, label: {
            Images.refresh
        })
    }
    
    var body: some View {
        NavigationView {
            CountryList(isRefreshAlertPresented: $isRefreshAlertPresented)
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular) // Uses InsetGrouped style which is bizarrely not available by default
                .alert(isPresented: $isExpandAlertPresented) {
                    Alert(title: allRegionExpansionAlertText)
                }
                .navigationBarTitle("Covidcheck")
                .navigationBarItems(trailing:
                    HStack(spacing: 20) {
                        expandAllRegionsButton
                        refreshDataButton
                    }
                )
        }
        .alert(isPresented: $isRefreshAlertPresented) {
            Alert(title: Text("Data Refreshed"))
        }
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
