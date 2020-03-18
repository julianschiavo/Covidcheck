//
//  InfoView.swift
//  Coronacheck
//
//  Created by Julian Schiavo on 15/3/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI

/// A view that displays information about the app as well as what some
/// of the symbols used in the app mean for new users.
struct InfoView: View {
    
    /// Whether the view is currently presented
    @Binding var isPresented: Bool
    
    let allPreferences: [Preference] = [DataSourcePreference()]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("ABOUT")) {
                    Text("Covidcheck is made by Julian Schiavo and open sourced on Github under the Unlicense license.")
                }
                Section(header: Text("PREFERENCES")) {
                    ForEach(allPreferences, id: \.id) { preference in
                        NavigationLink(destination: PreferenceView(preference: preference, isPresented: self.$isPresented)) {
                            HStack {
                                Text(preference.name)
                                    .foregroundColor(.primary)
                                Spacer()
                                Text(preference.value)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                Section(header: Text("SYMBOLS AND ORDERING")) {
                    VStack(alignment: .leading) {
                        Text("Regions are ordered by number of current cases (infected but not dead or recovered). Countries are ordered by number of infections.")
                            .lineLimit(nil)
                        Token(color: .red, image: Images.casesInfected, text: "Number of people infected")
                        Token(color: .black, image: Images.casesDead, text: "Number of deaths from COVID-19")
                        Token(color: .green, image: Images.casesRecovered, text: "Number of recovered cases")
                        Token(color: .gray, image: Images.casesCurrent, text: "Number of current cases (infected and not dead or recovered)")
                        Token(color: .gray, image: Images.casesIncrease, text: "Increase in current cases since last app open")
                        Token(color: .gray, image: Images.casesDecrease, text: "Decrease in current cases since last app open")
                    }
                    .padding([.top, .bottom], 10)
                }
            }
            .listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular) // Use InsetGrouped style which is bizarrely not available by default
            .navigationBarTitle("Info")
            .navigationBarItems(trailing:
                Button(action: {
                    self.isPresented.toggle()
                }, label: {
                    Text("Done")
                })
            )
        }
    }
}
