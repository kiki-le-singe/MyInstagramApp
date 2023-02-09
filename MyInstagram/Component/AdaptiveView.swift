//
//  AdaptiveView.swift
//  MyInstagram
//
//  Created by Anthony Albertini on 07/02/2023.
//

// https://www.hackingwithswift.com/quick-start/swiftui/how-to-show-different-images-and-other-views-in-light-or-dark-mode

import SwiftUI

struct AdaptiveView<T: View, U: View>: View {
    @Environment(\.colorScheme) var colorScheme
    let lightView: T
    let darkView: U

    init(lightView: T, darkView: U) {
        self.lightView = lightView
        self.darkView = darkView
    }

    init(lightView: () -> T, darkView: () -> U) {
        self.lightView = lightView()
        self.darkView = darkView()
    }

    @ViewBuilder var body: some View {
        if colorScheme == .light {
            lightView
        } else {
            darkView
        }
    }
}

struct AdaptiveView_Previews: PreviewProvider {
    static var previews: some View {
        AdaptiveView {
            EmptyView()
        } darkView: {
            EmptyView()
        }
    }
}
