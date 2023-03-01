//
//  PostFooterIconView.swift
//  MyInstagram
//
//  Created by Anthony Albertini on 27/02/2023.
//

import SwiftUI

struct PostFooterIconView: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject var animations = Animations()
    @State private var isFilled = false
    let icon: String
    var foregroundColor: Color? = nil
    var callback: (() -> Void)? = nil

    var body: some View {
        let defaultForegroundColor: Color = colorScheme == .dark ? .white : .black

        Image(systemName: "\(icon)\(isFilled ? ".fill" : "")")
            .scaleEffect(animations.scale)
            .onTapGesture {
                animations.scaleEffect()
                
                withAnimation {
                    self.isFilled.toggle()
                    
                    callback?()
                }
            }
            .foregroundColor(isFilled && foregroundColor != nil ? foregroundColor : defaultForegroundColor)
    }
}

struct PostFooterIconView_Previews: PreviewProvider {
    static var previews: some View {
        PostFooterIconView(icon: "heart", foregroundColor: Color.red)
    }
}
