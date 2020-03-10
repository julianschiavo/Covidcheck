//
//  Erase.swift
//  Coronacheck
//
//  Created by Julian Schiavo on 30/1/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI

struct Erase: View {
    
    var body: AnyView
    
    /// Create an instance that type-erases `view`.
    init<V>(_ view: () -> V) where V: View {
        self.body = AnyView(view())
    }
    
}
