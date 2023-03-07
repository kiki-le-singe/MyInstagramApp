//
//  FormattedWithSeparator.swift
//  MyInstagram
//
//  Created by Anthony Albertini on 07/03/2023.
//

import Foundation

// https://www.hackingwithswift.com/quick-start/beginners/how-to-create-and-use-protocol-extensions
// https://stackoverflow.com/questions/29999024/adding-thousand-separator-to-int-in-swift

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        return formatter
    }()
}

extension Numeric {
    var formattedWithSeparator: String { Formatter.withSeparator.string(for: self) ?? "" }
}
