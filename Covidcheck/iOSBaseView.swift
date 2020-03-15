//
//  iOSBaseView.swift
//  Coronacheck
//
//  Created by Julian Schiavo on 8/3/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI

/// The base view displayed at the root of the app, containing alerts and the
/// `RegionList`. A separate base view is used on iOS and watchOS as watchOS
/// does not support some features such as `NavigationView`.
struct BaseView: View {
    
    @ObservedObject private var dataManager = DataManager.shared
    
    // Variables containing the display state of sheets and alerts
    @State private var isInfoViewPresented = false
    @State private var isRefreshAlertPresented = false
    @State private var isExpandAlertPresented = false
    
    var allRegionExpansionAlertText: Text {
        Text(dataManager.areAllRegionsExpanded ? "All Regions Expanded" : "All Regions Collapsed")
    }
    
    var expandAllRegionsButtonImage: Image {
        dataManager.areAllRegionsExpanded ? Images.expanded : Images.collapsed
    }
    
    var infoButton: some View {
        Button(action: {
            self.isInfoViewPresented.toggle()
        }, label: {
            Images.info
                .padding(5)
                .background(Color.clear)
                .clipShape(Circle())
        })
        .sheet(isPresented: $isInfoViewPresented) {
            InfoView(isPresented: self.$isInfoViewPresented)
        }
    }
    
    var expandAllRegionsButton: some View {
        Button(action: {
            self.dataManager.toggleAllRegionsExpanded()
            self.isExpandAlertPresented.toggle()
        }, label: {
            expandAllRegionsButtonImage
                .padding(5)
                .background(Color.clear)
                .clipShape(Circle())
        })
        .alert(isPresented: $isExpandAlertPresented) {
            Alert(title: allRegionExpansionAlertText)
        }
    }
    
    var refreshDataButton: some View {
        Button(action: {
            self.isRefreshAlertPresented.toggle()
            DataManager.shared.updateData()
        }, label: {
            Images.refresh
                .padding(5)
                .background(Color.clear)
                .clipShape(Circle())
        })
        .alert(isPresented: $isRefreshAlertPresented) {
            Alert(title: Text("Data Refreshed"))
        }
    }
    
    var body: some View {
        NavigationView {
            RegionList(isRefreshAlertPresented: $isRefreshAlertPresented)
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular) // Use InsetGrouped style which is bizarrely not available by default
                .navigationBarTitle("Covidcheck")
                .navigationBarItems(leading: infoButton, trailing:
                    HStack(spacing: 20) {
                        expandAllRegionsButton
                        refreshDataButton
                    }
                )
        }
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
