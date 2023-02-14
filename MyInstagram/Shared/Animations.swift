//
//  Animations.swift
//  MyInstagram
//
//  Created by Anthony Albertini on 14/02/2023.
//

import Foundation
import SwiftUI

class Animations: ObservableObject {
    @Published var scale: CGFloat = 1
    @Published var isAnimationEnded: Bool = false

    func scaleEffect(
        animation: Animation? = .spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.5),
        firstActions: (() -> Void)? = nil,
        secondActions: (() -> Void)? = nil
    ) -> Void {
        DispatchQueue.main.async {
            withAnimation(
                animation
            ) {
                self.isAnimationEnded = true
                self.scale = 0.5
                firstActions?()
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation(
                animation
            ) {
                self.scale = 1
                secondActions?()
                self.isAnimationEnded = false
            }
        }
    }
}
