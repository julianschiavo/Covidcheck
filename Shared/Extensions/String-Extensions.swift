//
//  String-NumericFilter.swift
//  Coronacheck
//
//  Created by Julian Schiavo on 9/2/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import UIKit

extension String {
    func removingNonNumericCharacters() -> String {
        self.replacingOccurrences(of:"[^0-9]", with: "", options: .regularExpression)
    }
    
    var kFormatted: String {
        guard let number = Float(self) else { return self }
        return number.kFormatted
    }
    
    func size(font: UIFont) -> CGSize {
        (self as NSString).size(withAttributes: [.font: font])
    }
}

extension FloatingPoint {
    /// Formats a number using the "1K" format if it is above 10,000
    var kFormatted: String {
        String(format: self >= 10000 ? "%.1fK" : "%.0f", (self >= 10000 ? self / 1000 : self) as! CVarArg )
    }
}
