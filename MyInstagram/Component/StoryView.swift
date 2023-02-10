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

    var body: some View {
            VStack {
                Button(action: {
                    print("coucou")
                }) {
                    Image(avatar)
                        .resizable()
                        .frame(width: 60, height: 60)
                        .cornerRadius(60)
                        .overlay(
                            Circle()
                                .stroke(LinearGradient(colors: [.purple, .red,.orange,.yellow], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.5)
                                .frame(width: 68, height: 68)
                        )
                            .padding(6)
                }
                
                Text(nickname)
                    .font(.caption)
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
