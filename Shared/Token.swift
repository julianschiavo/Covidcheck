//
//  Token.swift
//  Coronacheck
//
//  Created by Julian Schiavo on 5/3/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI

//struct TokenData: Hashable {
//    var color: Color
////    var image: Image
//    var text: String
//    
//    var image: Image {
//        if let customName = imageCustomName {
//            return Image(customName)
//        } else if let systemName = imageSystemName {
//            return Image(systemName: systemName)
//        } else {
//            fatalError()
//        }
//    }
//    var imageCustomName: String?
//    var imageSystemName: String?
//    
//    var token: Token { Token(color: color, image: image, text: text) }
//}

struct Token: View, Identifiable {
    
    let monospacedDigitFont = UIFont.monospacedDigitFont(for: .body, weight: .regular)
    
    var color: Color
    var image: Image
    var text: String
    
    var id: String {
        text
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

struct TokenListHeightKey: PreferenceKey {
    static func reduce(value: inout Anchor<CGRect>?, nextValue: () -> Anchor<CGRect>?) {
        value = value ?? nextValue()
    }
}

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

//    func entireListHeight() -> CGFloat {
//        guard let token = tokens.first else { return 0}
//
//        var lineCount = 0
//        for tokensPerLine in (1...tokens.count).reversed() {
//            guard tokenWidth(count: CGFloat(tokensPerLine)) < width || tokensPerLine == 1 else { continue }
//            lineCount = Int(tokens.count / tokensPerLine)
//        }
//        return CGFloat(lineCount) * tokenHeight()
//    }
}

//struct TokenList: View {
//
//    var tokens = [Token]()
//
//    private func rowCounts(_ geometry: GeometryProxy) -> [Int] { TagList.rowCounts(tags: orderedTags, padding: 26, parentWidth: geometry.size.width) }
//
//    private func tag(rowCounts: [Int], rowIndex: Int, itemIndex: Int) -> String {
//        let sumOfPreviousRows = rowCounts.enumerated().reduce(0) { total, next in
//            if next.offset < rowIndex {
//                return total + next.element
//            } else {
//                return total
//            }
//        }
//        let orderedTagsIndex = sumOfPreviousRows + itemIndex
//        guard orderedTags.count > orderedTagsIndex else { return "[Unknown]" }
//        return orderedTags[orderedTagsIndex]
//    }
//
//    var body: some View {
//        GeometryReader { geometry in
//            VStack(alignment: .leading) {
//                ForEach(0 ..< self.rowCounts(geometry).count, id: \.self) { rowIndex in
//                    HStack {
//                        ForEach(0 ..< self.rowCounts(geometry)[rowIndex], id: \.self) { itemIndex in
//                            TagButton(title: self.tag(rowCounts: self.rowCounts(geometry), rowIndex: rowIndex, itemIndex: itemIndex), selectedTags: self.$selectedTags)
//                        }
//                        Spacer()
//                    }.padding(.vertical, 4)
//                }
//                Spacer()
//            }
//        }
//    }
//}
//
//extension String {
//
//    func widthOfString(usingFont font: UIFont) -> CGFloat {
//        let fontAttributes = [NSAttributedString.Key.font: font]
//        let size = self.size(withAttributes: fontAttributes)
//        return size.width
//    }
//
//}
//
//extension TokenList {
//    static func rowCounts(tokens: [Token], padding: CGFloat, parentWidth: CGFloat) -> [Int] {
////        let tokenWidths = tags.map{ $0.widthOfString(usingFont: UIFont.preferredFont(forTextStyle: .headline)) }
//        let tokenWidths = tokens.map { $0.i }
//
//        var currentLineTotal: CGFloat = 0
//        var currentRowCount: Int = 0
//        var result: [Int] = []
//
//        for tagWidth in tagWidths {
//            let effectiveWidth = tagWidth + (2 * padding)
//            if currentLineTotal + effectiveWidth <= parentWidth {
//                currentLineTotal += effectiveWidth
//                currentRowCount += 1
//                guard result.count != 0 else { result.append(1); continue }
//                result[result.count - 1] = currentRowCount
//            } else {
//                currentLineTotal = effectiveWidth
//                currentRowCount = 1
//                result.append(1)
//            }
//        }
//
//        return result
//    }
//}


////////////////////////////////////////////////////////////////////////

//struct TokenList: View {
//
//    var tokens: [TokenData]
//
//    var body: some View {
//        GeometryReader { geometry in
//            self.generateContent(in: geometry)
//        }
//    }
//
//    private func generateContent(in g: GeometryProxy) -> some View {
//        var width = CGFloat.zero
//        var height = CGFloat.zero
//
//        return ZStack(alignment: .topLeading) {
//            ForEach(self.tokens, id: \.self) { token in
//                token.token
//                    .alignmentGuide(.leading, computeValue: { d in
//                        if (abs(width - d.width) > g.size.width)
//                        {
//                            width = 0
//                            height -= d.height
//                        }
//                        let result = width
//                        if token == self.tokens.last! {
//                            width = 0 //last item
//                        } else {
//                            width -= d.width
//                        }
//                        return result
//                    })
//                    .alignmentGuide(.top, computeValue: {d in
//                        let result = height
//                        if token == self.tokens.last! {
//                            height = 0 // last item
//                        }
//                        return result
//                    })
//            }
//        }
//    }
//}


//struct TokenList: View {
//    
//    var tokens: [Token]
//    
//    private func rowCounts(_ geometry: GeometryProxy) -> [Int] { TokenList.rowCounts(tags: tokens, padding: 26, parentWidth: geometry.size.width) }
//    
//    private func tag(rowCounts: [Int], rowIndex: Int, itemIndex: Int) -> String {
//        let sumOfPreviousRows = rowCounts.enumerated().reduce(0) { total, next in
//            if next.offset < rowIndex {
//                return total + next.element
//            } else {
//                return total
//            }
//        }
//        let orderedTagsIndex = sumOfPreviousRows + itemIndex
//        guard orderedTags.count > orderedTagsIndex else { return "[Unknown]" }
//        return orderedTags[orderedTagsIndex]
//    }
//    
//    var body: some View {
//        GeometryReader { geometry in
//            VStack(alignment: .leading) {
//                ForEach(0 ..< self.rowCounts(geometry).count, id: \.self) { rowIndex in
//                    HStack {
//                        ForEach(0 ..< self.rowCounts(geometry)[rowIndex], id: \.self) { itemIndex in
//                            TagButton(title: self.tag(rowCounts: self.rowCounts(geometry), rowIndex: rowIndex, itemIndex: itemIndex), selectedTags: self.$selectedTags)
//                        }
//                        Spacer()
//                    }.padding(.vertical, 4)
//                }
//                Spacer()
//            }
//        }
//    }
//    
//    static func rowCounts(tags: [String], padding: CGFloat, parentWidth: CGFloat) -> [Int] {
//        let tagWidths = tags.map{$0.widthOfString(usingFont: UIFont.preferredFont(forTextStyle: .headline))}
//        
//        var currentLineTotal: CGFloat = 0
//        var currentRowCount: Int = 0
//        var result: [Int] = []
//        
//        for tagWidth in tagWidths {
//            let effectiveWidth = tagWidth + (2 * padding)
//            if currentLineTotal + effectiveWidth <= parentWidth {
//                currentLineTotal += effectiveWidth
//                currentRowCount += 1
//                guard result.count != 0 else { result.append(1); continue }
//                result[result.count - 1] = currentRowCount
//            } else {
//                currentLineTotal = effectiveWidth
//                currentRowCount = 1
//                result.append(1)
//            }
//        }
//        
//        return result
//    }
//}
//
//extension String {
//    
//    func widthOfString(usingFont font: UIFont) -> CGFloat {
//        let fontAttributes = [NSAttributedString.Key.font: font]
//        let size = self.size(withAttributes: fontAttributes)
//        return size.width
//    }
//    
//}
//
