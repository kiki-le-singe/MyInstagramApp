//
//  Config.swift
//  MyInstagram
//
//  Created by Anthony Albertini on 24/01/2023.
//

import SwiftUI

class Settings {
    // Light and Dark modes: https://designcode.io/swiftui-handbook-light-dark-modes
    static let textColorScheme = Color("TextColorScheme")
    static let backgroundColorScheme = Color("BackgroundColorScheme")
    
    // Fonts
    static let nicknameSize = 11.5
    
    // User Interface
    static var device : UIUserInterfaceIdiom { UIDevice.current.userInterfaceIdiom }
    static func isPhone () -> Bool {
        return self.device == .phone
    }
    static func isPad () -> Bool {
        return self.device == .pad
    }
}
