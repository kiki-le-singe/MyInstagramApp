//
//  HomeView.swift
//  MyInstagram
//
//  Created by Anthony Albertini on 29/10/2022.
//

import SwiftUI

struct HomeView: View {
    let colors: [Color] = [.red, .blue, .green, .gray, .pink, .yellow, .orange, .purple]
    let avatars: [User] = [
        User(firstname: "Monkey 1", lastname: "Monkey", nickname: "monkey_1", age: 2, gender: .male, avatar: "image_1"),
        User(firstname: "Monkey 1", lastname: "Monkey", nickname: "monkey_2", age: 4, gender: .female, avatar: "image_2"),
        User(firstname: "Monkey 1", lastname: "Monkey", nickname: "monkey_3", age: 2, gender: .male, avatar: "image_3"),
        User(firstname: "Monkey 1", lastname: "Monkey", nickname: "monkey_4", age: 5, gender: .male, avatar: "image_4"),
        User(firstname: "Monkey 1", lastname: "Monkey", nickname: "monkey_5", age: 1, gender: .female, avatar: "image_5"),
        User(firstname: "Monkey 1", lastname: "Monkey", nickname: "monkey_6", age: 3, gender: .female, avatar: "image_6"),
        User(firstname: "Monkey 1", lastname: "Monkey", nickname: "monkey_1", age: 2, gender: .male, avatar: "image_1"),
        User(firstname: "Monkey 1", lastname: "Monkey", nickname: "monkey_2", age: 4, gender: .female, avatar: "image_2"),
        User(firstname: "Monkey 1", lastname: "Monkey", nickname: "monkey_3", age: 2, gender: .male, avatar: "image_3"),
        User(firstname: "Monkey 1", lastname: "Monkey", nickname: "monkey_4", age: 5, gender: .male, avatar: "image_4"),
        User(firstname: "Monkey 1", lastname: "Monkey", nickname: "monkey_5", age: 1, gender: .female, avatar: "image_5"),
        User(firstname: "Monkey 1", lastname: "Monkey", nickname: "monkey_6", age: 3, gender: .female, avatar: "image_6"),
        User(firstname: "Monkey 1", lastname: "Monkey", nickname: "monkey_3", age: 2, gender: .male, avatar: "image_3"),
        User(firstname: "Monkey 1", lastname: "Monkey", nickname: "monkey_4", age: 5, gender: .male, avatar: "image_4"),
        User(firstname: "Monkey 1", lastname: "Monkey", nickname: "monkey_5", age: 1, gender: .female, avatar: "image_5"),
        User(firstname: "Monkey 1", lastname: "Monkey", nickname: "monkey_6", age: 3, gender: .female, avatar: "image_6"),
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ScrollView(.horizontal, showsIndicators: false) {
                    
//                    LazyHStack(spacing: 12) {
                    HStack(spacing: 12) {
                        ForEach(avatars, id: \.self) { user in
                            StoryItemView(avatar: user.avatar, nickname: user.nickname ?? "")
                        }
                    }
                }
                .padding(8)
                
                VStack(spacing: 20, content: {
                    ForEach(colors, id: \.self) { color in
                        color.frame(height: 200).cornerRadius(20)
                    }
                })
            }
            .navigationBarItems(
                leading: Button(action: {
                }, label: {
                    Menu {
                            Button(action: {

                            }) {
                                Label("Following", systemImage: "person.2")
                            }
                            Button(action: {

                            }) {
                                Label("Favourites", systemImage: "star")
                            }
                    } label: {
                        HStack {
                            Text("My Instagram").foregroundColor(Settings.textColorScheme)
                            Image(systemName: "arrow.down")
                        }
                    }.foregroundColor(Settings.textColorScheme)
                }),
                trailing:
                    HStack(content: {
                        NavigationLink(destination: Text("This is the Settings View"), label: {
                            Image(systemName: "plus.app")
                        })
                        NavigationLink(destination: Text("This is the Notifications View"), label: {
                            Image(systemName: "heart")
                        })
                        NavigationLink(destination: Text("This is the Messages View"), label: {
                            Image(systemName: "paperplane")
                        })
                                       
                    }).foregroundColor(Settings.textColorScheme)

            )
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        HomeView()
            .previewDevice("iPad Pro (12.9-inch) (6th generation)")
    }
}
