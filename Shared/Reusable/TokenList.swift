//
//  TokenList.swift
//  Coronacheck
//
//  Created by Julian Schiavo on 15/3/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI

/// A list that displays tokens based on the available width,
/// wrapping tokens that don't fit to the next line.
struct TokenList: View {
    
    var tokens: [Token]
    var width: CGFloat = 0
    
    #if os(iOS)
    private let tokenImageSize: CGFloat = 20
    #else
    private let tokenImageSize: CGFloat = 10
    #endif
    private let tokenPadding: CGFloat = 5 * 2
    private let tokenSpacing: CGFloat = 5
    private let monospacedDigitFont = UIFont.monospacedDigitFont(for: .body, weight: .regular)
    
    var body: some View {
        for i in (1...tokens.count).reversed() {
            guard tokenWidth(count: CGFloat(i)) < width || i == 1 else { continue }
            return VStack(alignment: .leading, spacing: tokenSpacing) {
                if !firstTokens(of: tokens, amount: i, offset: 0).isEmpty {
                    HStack(alignment: .top, spacing: tokenSpacing) {
                        stackTokens(firstTokens(of: tokens, amount: i, offset: 0))
                    }
                }
                if !firstTokens(of: tokens, amount: i, offset: i).isEmpty {
                    HStack(alignment: .top, spacing: tokenSpacing) {
                        stackTokens(firstTokens(of: tokens, amount: i, offset: i))
                    }
                }
                if !firstTokens(of: tokens, amount: i, offset: i * 2).isEmpty {
                    HStack(alignment: .top, spacing: tokenSpacing) {
                        stackTokens(firstTokens(of: tokens, amount: i, offset: i * 2))
                    }
                }
                if !firstTokens(of: tokens, amount: i, offset: i * 3).isEmpty {
                    HStack(alignment: .top, spacing: tokenSpacing) {
                        stackTokens(firstTokens(of: tokens, amount: i, offset: i * 3))
                    }
                }
                
            }
        }
        fatalError()
    }
    
    func firstTokens(of tokens: [Token], amount: Int, offset: Int) -> [Token] {
        let finalCount = amount + offset
        let range = offset..<finalCount
        
        var newArray = [Token]()
        for i in range where tokens.indices.contains(i) {
            newArray.append(tokens[i])
        }
        return newArray
    }
    
    func stackTokens(_ tokens: [Token]) -> HStack<ForEach<[Token], String, Token>> {
        return HStack(spacing: self.tokenSpacing) {
            ForEach(tokens) { token in
                token
            }
        }
    }
    
    func tokenWidth(count: CGFloat) -> CGFloat {
        let spacing = (tokenSpacing * (count - 1))
        return tokens.prefix(Int(count)).map { tokenSize($0).width }.reduce(0, +) + spacing
    }
    
    func tokenHeight() -> CGFloat {
        guard let token = tokens.first else { return 0 }
        return tokenSize(token).height
    }
    
    func tokenSize(_ token: Token) -> (width: CGFloat, height: CGFloat) {
        let textSize = token.text.kFormatted.size(font: monospacedDigitFont)
        return (width: tokenImageSize + textSize.width + tokenPadding, height: textSize.height + tokenPadding)
    }
}


#if DEBUG

struct TokenList_Previews: PreviewProvider {
    static var previews: some View {
        TokenList(tokens: [
            Token(color: .red, image: Images.casesInfected, text: "Number of people infected"),
            Token(color: .black, image: Images.casesDead, text: "Number of deaths from COVID-19")
        ])
    }
}

#endif
