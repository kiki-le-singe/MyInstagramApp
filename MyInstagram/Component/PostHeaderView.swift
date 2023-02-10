//
//  PostHeaderView.swift
//  MyInstagram
//
//  Created by Anthony Albertini on 10/02/2023.
//

import SwiftUI

struct PostHeaderView: View {
    @State var avatar: String
    @State var nickname: String = ""

    var body: some View {
        HStack(spacing: 8) {
            
            Button(action: {

            }) {
                Image(avatar)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .cornerRadius(30)
            }

            Button(action: {

            }) {
                Text(nickname)
                    .font(.system(size: Settings.nicknameSize))
                    .fontWeight(.bold)
                    .foregroundColor(Settings.textColorScheme)
            }
            
            Spacer()

            Button(action: {
                print("coucou")
            }) {
                Image(systemName: "ellipsis")
                    .foregroundColor(Settings.textColorScheme)
            }
            
        }
        .padding(.horizontal, 13)
    }
}

struct PostHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        PostHeaderView(avatar: "image_2", nickname: "monkey_2")
            .previewLayout(.sizeThatFits)
    }
}
