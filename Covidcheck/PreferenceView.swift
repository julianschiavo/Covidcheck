//
//  PreferenceView.swift
//  Covidcheck
//
//  Created by Julian Schiavo on 18/3/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI

struct PreferenceView: View {
    
    let preference: Preference
    
    @Binding var isPresented: Bool
    
    var body: some View {
        if preference.type == .picker {
            return PickerPreferenceView(preference: preference, isPresented: $isPresented)
        } else {
            fatalError("")
        }
    }
}

struct PickerPreferenceView: View {
    
    let preference: Preference
    
    @Binding var isPresented: Bool
    
    var body: some View {
        guard preference.type == .picker else { fatalError("Wrong preference type") }
        let pickerOptions = preference.pickerOptions
        let pickerOptionNames = Array(pickerOptions.keys).sorted()
        
        return List(pickerOptionNames, id: \.self) { option in
            Button(action: {
                self.preference.switch(to: pickerOptions[option])
                self.isPresented.toggle()
            }, label: {
                Text(option)
            })
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle(preference.name)
    }
}
