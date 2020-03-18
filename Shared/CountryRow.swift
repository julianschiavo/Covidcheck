//
//  CountryRow.swift
//  Coronacheck
//
//  Created by Julian Schiavo on 30/1/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI
import UIKit

/// A row in a `RegionInfoSection` the amount of infections, deaths, and recovered
/// cases for a specific country. A country flag is shown where available on iOS,
/// and in some cases on watchOS. Where available from the data source, the
/// last update date and any comments on the country are also shown on iOS.
struct CountryRow: View {
    
    var country: CountryInfo
    @Binding var width: CGFloat
    
    var body: some View {
        // Create the tokens used to display infection info
        var tokens = [Token(color: .red, image: Images.casesInfected, text: "\(country.infectionCount)"),
                      Token(color: .black, image: Images.casesDead, text: "\(country.deathCount)")]
        if country.recoveredCount > 0 {
            let recoveredToken = Token(color: .green, image: Images.casesRecovered, text: "\(country.recoveredCount)")
            tokens.append(recoveredToken)
        }
        if country.difference != nil {
            let currentToken = Token(color: .gray, image: Images.casesCurrent, text: "\(country.currentCount)")
            tokens.append(currentToken)
            
            if country.difference ?? 0 > 0 {
                let differenceToken = Token(color: .gray, image: Images.casesIncrease, text: "\(country.difference ?? 0)")
                tokens.append(differenceToken)
            } else if country.difference ?? 0 < 0 {
                let differenceToken = Token(color: .gray, image: Images.casesDecrease, text: "\(country.difference ?? 0)")
                tokens.append(differenceToken)
            }
        }
        
        return HStack(spacing: 10) {
            #if os(iOS)
            // On iOS, show a large image on the left of the info
            country.data?.image
                .resizable()
                .frame(width: 30, height: 30)
            #endif

            VStack(alignment: .leading, spacing: 3) {
                #if os(watchOS)
                // On watchOS, show a smaller image above the info on highly affected countries to save space
                if country.infectionCount > 200 {
                    if country.data?.image != nil {
                        country.data?.image
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                }
                #endif

                #if os(iOS)
                Text(country.name)
                    .font(.system(size: 25, weight: .medium, design: .rounded))
                #else
                Text(country.name)
                    .font(.system(.headline, design: .rounded))
                    .fontWeight(.semibold)
                #endif
                
                // Display the tokens created earlier in a list that automatically displays them based on the available width
                TokenList(tokens: tokens, width: width)

                // Where available from the data source, the last update date and any comments on the country are also shown on iOS
                #if os(iOS)
                if !country.lastUpdated.isEmpty {
                    Text("Last updated \(country.lastUpdated)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                if !country.comments.isEmpty {
                    Text(country.comments)
                        .lineLimit(nil)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                #endif
            }
        }
        .padding([.top, .bottom], 10)
        
    }
}

#if DEBUG

struct CountryRow_Previews: PreviewProvider {
    static var previews: some View {
        let countryInfo = CountryInfo(name: "Country", data: .antarctica, infectionCount: 50, deathCount: 10, recoveredCount: 20, difference: 100, lastUpdated: "", comments: "")
        return CountryRow(country: countryInfo, width: .constant(200))
    }
}

#endif
