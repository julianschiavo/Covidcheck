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
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text(L10n.Info.About.title)) {
                    Text(L10n.Info.About.description)
                }
                Section(header: Text(L10n.Info.SymbolDescription.title)) {
                    VStack(alignment: .leading) {
                        Token(color: .red, image: Images.casesInfected, text: L10n.Info.SymbolDescription.numberOfPeopleInfected)
                        Token(color: .black, image: Images.casesDead, text: L10n.Info.SymbolDescription.numberOfDeathsFromCOVID19)
                        Token(color: .green, image: Images.casesRecovered, text: L10n.Info.SymbolDescription.numberOfRecoveredCases)
                        Token(color: .gray, image: Images.casesCurrent, text: L10n.Info.SymbolDescription.numberOfCurrentCases)
                        Token(color: .gray, image: Images.casesIncrease, text: L10n.Info.SymbolDescription.increaseInCurrentCasesSinceLastAppOpen)
                        Token(color: .gray, image: Images.casesDecrease, text: L10n.Info.SymbolDescription.decreaseInCurrentCasesSinceLastAppOpen)
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
