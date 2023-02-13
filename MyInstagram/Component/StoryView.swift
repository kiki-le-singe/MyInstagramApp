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
    @State var scale: CGFloat = 1
    @State var degrees: Double = 0
    @State var isAnimationEnded: Bool = false

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
                    .scaleEffect(scale)
                    .onTapGesture {
                        DispatchQueue.main.async {
                            withAnimation(
                                .spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.5)
                            ) {
                                self.isAnimationEnded.toggle()
                                self.scale = 0.5
                                self.degrees = 360
                            }
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            withAnimation(
                                .spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.5)
                            ) {
                                self.scale = 1
                                self.degrees = 0
                                self.isAnimationEnded.toggle()
                            }
                        }
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
