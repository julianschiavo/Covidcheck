//
//  Token.swift
//  Coronacheck
//
//  Created by Julian Schiavo on 5/3/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI

/// A token, containing text and an image on a colored rounded background rect
struct Token: View, Identifiable {
    
    let monospacedDigitFont = UIFont.monospacedDigitFont(for: .body, weight: .regular)
    
    var color: Color
    var image: Image
    var text: String
    
    var id: String {
        UUID().uuidString
    }
    
    var body: some View {
        HStack(spacing: 2) {
            #if os(iOS)
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
            #else
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 10, height: 10)
            #endif
            Text(text.kFormatted)
                .font(Font(monospacedDigitFont))
                .allowsTightening(true)
                .truncationMode(.tail)
        }
        .padding(5)
        .background(color)
        .foregroundColor(.white)
        .cornerRadius(5)
    }
    
}

#if DEBUG

struct Token_Previews: PreviewProvider {
    static var previews: some View {
        List {
            Token(color: .red, image: Images.casesInfected, text: "Number of people infected")
            Token(color: .black, image: Images.casesDead, text: "Number of deaths from COVID-19")
            Token(color: .green, image: Images.casesRecovered, text: "Number of recovered cases")
            Token(color: .gray, image: Images.casesCurrent, text: "Number of current cases (infected and not dead or recovered)")
        }
    }
}

#endif
