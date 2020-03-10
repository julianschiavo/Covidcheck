//
//  CountryRow.swift
//  Coronacheck
//
//  Created by Julian Schiavo on 30/1/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI
import UIKit

struct CountryRow: View {
    
    var country: CountryInfo
    @Binding var width: CGFloat
    
    var body: some View {
//        #if os(iOS)
//        let fullTokenText = NSMutableAttributedString(string: "")
//
//        let infectionImage = NSAttributedString(attachment: NSTextAttachment(image: UIImage(systemName: "thermometer")!))
//        let infectionText = NSAttributedString(string: "\(country.infectionCount)".kFormatted, attributes: [.font: monospacedDigitFont, .foregroundColor: UIColor.white, .backgroundColor: UIColor.red])
//        fullTokenText.append(infectionImage)
//        fullTokenText.append(infectionText)
//        #endif
        
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
            country.data?.image
                .resizable()
                .frame(width: 30, height: 30)
            #endif

            VStack(alignment: .leading, spacing: 3) {
                #if os(watchOS)
                if country.data?.image != nil {
                    country.data?.image
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                #endif

                #if os(iOS)
                Text(country.name)
                    .font(.system(size: 25, weight: .medium, design: .rounded))

                #else
                Text(country.name)
                    .font(.system(.headline, design: .rounded))
                    .fontWeight(.semibold)
//                (Text("\(country.infectionCount)".kFormatted).foregroundColor(.gray) + Text("     ") + Text("\(country.deathCount)".kFormatted).foregroundColor(.red) + Text("     ") + Text("\(country.recoveredCount)".kFormatted).foregroundColor(.green))
                #endif
                
                TokenList(tokens: tokens, width: width)

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
    
//    func runX(tokens: [Token], width: CGFloat) -> some View {
//        for i in (1...3).reversed() {
//            guard tokenWidth(count: CGFloat(i)) < width || i == 1 else { continue }
//            return VStack(alignment: .trailing) {
//                HStack(spacing: tokenSpacing) {
//                    stackTokens(firstTokens(of: tokens, amount: i, offset: 0))
//                }
//                if tokens.count > i {
//                    HStack(spacing: tokenSpacing) {
//                        stackTokens(firstTokens(of: tokens, amount: i, offset: i))
//                    }
//                }
//                if tokens.count > i * 2 {
//                    HStack(spacing: tokenSpacing) {
//                        stackTokens(firstTokens(of: tokens, amount: i, offset: i * 2))
//                    }
//                }
//            }.frame(height: self.tokenHeight() * 2)
//        }
//        fatalError()
////        return VStack { HStack { stackTokens([]) } }.frame(height: 0)
//    }
    
    // MARK: - Geometry Calc
    
//    #if os(iOS)
//    let tokenImageSize: CGFloat = 20
//    #else
//    let tokenImageSize: CGFloat = 10
//    #endif
//    let tokenPadding: CGFloat = 5 * 2
//    let tokenSpacing: CGFloat = 5
//
//    func firstTokens(of tokens: [Token], amount: Int, offset: Int) -> [Token] {
//        let finalCount = amount + offset
//
//        var newArray = [Token]()
//        for i in offset..<finalCount {
//            guard tokens.indices.contains(i) else { continue }
//            newArray.append(tokens[i])
//        }
//        return newArray
//    }
//
//    func stackTokens(_ tokens: [Token]) -> HStack<ForEach<[Token], String, Token>> {
//        return HStack(spacing: self.tokenSpacing) {
//            ForEach(tokens) { token in
//                token
//            }
//        }
//    }
//
//    func tokenWidth(count: CGFloat) -> CGFloat {
//        let spacing = (tokenSpacing * (count - 1))
//        switch count {
//        case 1:
//            return infectedTokenSize().width
//        case 2:
//            return infectedTokenSize().width + deathTokenSize().width + spacing
//        case 3:
//            return infectedTokenSize().width + deathTokenSize().width + recoveredTokenSize().width + spacing
//        case 4:
//            return infectedTokenSize().width + deathTokenSize().width + recoveredTokenSize().width + currentTokenSize().width + spacing
//        default:
//            return infectedTokenSize().width + deathTokenSize().width + recoveredTokenSize().width + currentTokenSize().width + differenceTokenSize().width + spacing
//        }
//    }
//
//    func tokenHeight() -> CGFloat {
//        infectedTokenSize().height
//    }
//
//    func infectedTokenSize() -> (width: CGFloat, height: CGFloat) {
//        let textSize = calculateStringSize("\(country.infectionCount)".kFormatted)
//        return (width: tokenImageSize + textSize.width + tokenPadding, height: textSize.height + tokenPadding)
//    }
//
//    func deathTokenSize() -> (width: CGFloat, height: CGFloat) {
//        let textSize = calculateStringSize("\(country.deathCount)".kFormatted)
//        return (width: tokenImageSize + textSize.width + tokenPadding, height: textSize.height + tokenPadding)
//    }
//
//    func recoveredTokenSize() -> (width: CGFloat, height: CGFloat) {
//        guard country.recoveredCount > 0 else { return (width: 0, height: 0) }
//        let textSize = calculateStringSize("\(country.recoveredCount)".kFormatted)
//        return (width: tokenImageSize + textSize.width + tokenPadding, height: textSize.height + tokenPadding)
//    }
//
//    func currentTokenSize() -> (width: CGFloat, height: CGFloat) {
//        guard country.difference != nil else { return (width: 0, height: 0) }
//        let textSize = calculateStringSize("\(country.currentCount)".kFormatted)
//        return (width: tokenImageSize + textSize.width + tokenPadding, height: textSize.height + tokenPadding)
//    }
//
//    func differenceTokenSize() -> (width: CGFloat, height: CGFloat) {
//        guard country.difference != nil else { return (width: 0, height: 0) }
//        let textSize = calculateStringSize("\(country.difference ?? 0)".kFormatted)
//        return (width: tokenImageSize + textSize.width + tokenPadding, height: textSize.height + tokenPadding)
//    }
//
//    func calculateStringSize(_ string: String) -> CGSize {
//        (string as NSString).size(withAttributes: [.font: monospacedDigitFont])
//    }
    
}

//struct CountryRow_Previews: PreviewProvider {
//    static var previews: some View {
//        CountryRow(country: CountryInfo(name: "Wuhan", infectionCount: 100, deathCount: 10, recoveredCount: 5, lastUpdated: "", comments: ""), width: 1000)
//    }
//}
