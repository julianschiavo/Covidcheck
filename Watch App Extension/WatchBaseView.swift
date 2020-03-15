//
//  BaseView.swift
//  Coronacheck
//
//  Created by Julian Schiavo on 30/1/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI

/// The base view displayed at the root of the app, containing alerts and the
/// `RegionList`. A separate base view is used on iOS and watchOS as watchOS
/// does not support some features such as `NavigationView`.
struct BaseView: View {
    
    @State var isRefreshAlertPresented = false
    @State private var expandedRegions = [Region]()
    
    var body: some View {
        RegionList(isRefreshAlertPresented: $isRefreshAlertPresented)
            .alert(isPresented: $isRefreshAlertPresented) {
                Alert(title: Text("Data Refreshed"), dismissButton: nil)
            }
            .navigationBarTitle("Covidcheck")
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
