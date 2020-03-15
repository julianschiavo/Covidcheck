//
//  UIFont-Improved.swift
//  Coronacheck
//
//  Created by Julian Schiavo on 31/1/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import UIKit

/// A collection of useful `UIFont` extensions
extension UIFont {
    @available(iOS 13.0, *) @available(watchOS, unavailable)
    var monospaced: UIFont {
        let monospacedFontDescriptor = fontDescriptor.withDesign(.monospaced) ?? fontDescriptor
        return UIFont(descriptor: monospacedFontDescriptor, size: 0)
    }
    
    var rounded: UIFont {
        let roundedFontDescriptor = fontDescriptor.withDesign(.rounded) ?? fontDescriptor
        return UIFont(descriptor: roundedFontDescriptor, size: 0)
    }
    
    @available(iOS 13.0, *) @available(watchOS, unavailable)
    var serif: UIFont {
        let serifFontDescriptor = fontDescriptor.withDesign(.serif) ?? fontDescriptor
        return UIFont(descriptor: serifFontDescriptor, size: 0)
    }
    
    var smallCaps: UIFont {
        let featureKeys: [UIFontDescriptor.FeatureKey: Int] = [
            .featureIdentifier: kUpperCaseType,
            .typeIdentifier: kUpperCaseSmallCapsSelector
        ]
        let attributes: [UIFontDescriptor.AttributeName: Any] = [
            .featureSettings: featureKeys
        ]
        let smallCapsFontDescriptor = fontDescriptor.addingAttributes(attributes)
        return UIFont(descriptor: smallCapsFontDescriptor, size: 0)
    }
    
    static func preferredFont(for textStyle: UIFont.TextStyle, weight: UIFont.Weight? = nil) -> UIFont {
        guard let weight = weight else { return UIFont.preferredFont(forTextStyle: textStyle) }
        let preferredFont = UIFont.preferredFont(forTextStyle: textStyle)
        let fontWithWeight = UIFont.systemFont(ofSize: preferredFont.pointSize, weight: weight)
        return UIFontMetrics.default.scaledFont(for: fontWithWeight)
    }
    
    static func monospacedDigitFont(for textStyle: UIFont.TextStyle, weight: UIFont.Weight? = nil) -> UIFont {
        guard let weight = weight else { return UIFont.preferredFont(forTextStyle: textStyle) }
        let preferredFont = UIFont.preferredFont(forTextStyle: textStyle)
        let fontWithWeight = UIFont.monospacedDigitSystemFont(ofSize: preferredFont.pointSize, weight: weight)
        return UIFontMetrics.default.scaledFont(for: fontWithWeight)
    }
    
    static func fixedSizeFont(for textStyle: UIFont.TextStyle, weight: UIFont.Weight = .regular) -> UIFont {
        let preferredFont = UIFont.preferredFont(forTextStyle: textStyle)
        let fontWithWeight = UIFont.systemFont(ofSize: preferredFont.pointSize, weight: weight)
        return fontWithWeight
    }
    
    static func sizeForFont(withTextStyle textStyle: UIFont.TextStyle) -> CGFloat {
        UIFont.preferredFont(forTextStyle: textStyle).pointSize
    }
}
