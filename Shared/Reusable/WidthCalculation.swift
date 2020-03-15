//
//  WidthCalculation.swift
//  Coronacheck
//
//  Created by Julian Schiavo on 11/3/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI

struct WidthPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        let newValue = nextValue()
        if newValue > 0, value == 0 {
            value = newValue
        }
    }
}

struct WidthRetriever: View {
    var body: some View {
        GeometryReader { geometry in
            Color.clear
                .preference(key: WidthPreferenceKey.self, value: geometry.size.width)
        }
    }
}
