//
//  extensions.swift
//  MightyCall Test Task
//
//  Created by Dmitry Likhaletov on 02.10.2020.
//

import UIKit

extension UIFont {
    var bold: UIFont {
        return with(.traitBold)
    }
    
    var italic: UIFont {
        return with(.traitItalic)
    }
    
    func with(_ traits: UIFontDescriptor.SymbolicTraits...) -> UIFont {
        guard let descriptor = self.fontDescriptor.withSymbolicTraits(UIFontDescriptor.SymbolicTraits(traits).union(self.fontDescriptor.symbolicTraits)) else {
            return self
        }
        return UIFont(descriptor: descriptor, size: 0)
    }
}

extension UIColor {
    convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
        assert(red >= 0 && red <= 255, "invalid red value!")
        assert(green >= 0 && green <= 255, "invalid green value!")
        assert(blue >= 0 && blue <= 255, "invalid blue value!")
        self.init(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
    }
}

extension DateFormatter {
    static func formatTime(from string: String) -> String {
        let df = DateFormatter()
        df.dateFormat = "HH:mm:ss"
        
        if let input = df.date(from: string) {
            df.dateFormat = "mm:ss"
            return df.string(from: input)
        }
        return ""
    }
}

extension String {
    static func format(with mask: String, phone: String) -> String {
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex
        
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                result.append(numbers[index])
                index = numbers.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
}
