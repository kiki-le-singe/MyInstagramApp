//
//  StoryView.swift
//  MyInstagram
//
//  Created by Anthony Albertini on 06/02/2023.
//

import SwiftUI

struct StoryView: View {
    @State var avatar: String
    @State var nickname: String = ""
    @State var degrees: Double = 0
    @StateObject var animations = Animations()

    func firstActions () {
        self.degrees = 360
    }
    func secondActions () {
        self.degrees = 0
    }
    
    var body: some View {
            VStack {
                Image(avatar)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .cornerRadius(60)
                    .overlay(
                        Circle()
                            .stroke(LinearGradient(colors: [.purple, .red,.orange,.yellow], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.5)
                            .frame(width: 68, height: 68)
                            .rotationEffect(.degrees(degrees))
                    )
                    .padding(6)
                    .scaleEffect(animations.scale)
                    .onTapGesture {
                        animations.scaleEffect(
                            firstActions: firstActions,
                            secondActions: secondActions
                        )
                    }
//                    .onLongPressGesture {
//                        print("Display ActionSheet")
//                    }
                
                Text(nickname)
                    .font(.system(size: Settings.nicknameSize))
                    .foregroundColor(Settings.textColorScheme)
            }
        }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView(avatar: "image_1", nickname: "monkey_1")
            .previewLayout(.sizeThatFits)
    }
}
