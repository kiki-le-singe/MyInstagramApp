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

//extension View {
//    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
//        if condition {
//            transform(self)
//        } else {
//            self
//        }
//    }
//}


// https://matteo-puccinelli.medium.com/conditionally-apply-modifiers-in-swiftui-51c1cf7f61d1
extension View {
    @ViewBuilder
    func ifCondition<TrueContent: View, FalseContent: View>(_ condition: Bool, then trueContent: (Self) -> TrueContent, else falseContent: (Self) -> FalseContent) -> some View {
        if condition {
            trueContent(self)
        } else {
            falseContent(self)
        }
    }

    @ViewBuilder
    func ifCondition<TrueContent: View>(_ condition: Bool, then trueContent: (Self) -> TrueContent) -> some View {
        if condition {
            trueContent(self)
        } else {
            self
        }
    }
}
