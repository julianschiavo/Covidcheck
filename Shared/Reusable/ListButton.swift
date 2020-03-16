//
//  ListButton.swift
//  Coronacheck
//
//  Created by Julian Schiavo on 11/3/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI

/// A simple button to be used in a `List` with default padding and image size
struct ListButton: View {
    var image: Image
    var text: String
    var action: () -> Void = {}
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 10) {
                image.font(.system(size: 20))
                
                Text(text)
            }
        }
        .foregroundColor(.primary)
    }
}

#if DEBUG

struct ListButton_Previews: PreviewProvider {
    static var previews: some View {
        ListButton(
            image: Images.refresh,
            text: "Refresh Data"
        )
    }
}

#endif
