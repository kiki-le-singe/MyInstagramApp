//
//  ConditionalModifier.swift
//  MyInstagram
//
//  Created by Anthony Albertini on 20/02/2023.
//

// https://designcode.io/swiftui-handbook-conditional-modifier
// https://betterprogramming.pub/conditionally-applying-view-modifiers-in-swiftui-c5541711eb41
// https://www.hapq.me/mastering-view-modifiers-in-swiftui-tips-and-tricks/
// https://www.kodeco.com/34699757-swiftui-view-modifiers-tutorial-for-ios#toc-anchor-001

import Foundation
import SwiftUI

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
