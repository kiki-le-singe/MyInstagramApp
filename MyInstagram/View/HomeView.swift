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
        User(firstname: "Monkey 1", lastname: "Monkey", nickname: "monkey_9", age: 4, gender: .male, avatar: "image_9"),
        User(firstname: "Monkey 1", lastname: "Monkey", nickname: "monkey_5", age: 1, gender: .female, avatar: "image_5"),
        User(firstname: "Monkey 1", lastname: "Monkey", nickname: "monkey_6", age: 3, gender: .female, avatar: "image_6"),
        User(firstname: "Monkey 1", lastname: "Monkey", nickname: "monkey_9", age: 4, gender: .male, avatar: "image_9"),
        User(firstname: "Monkey 1", lastname: "Monkey", nickname: "monkey_1", age: 2, gender: .male, avatar: "image_1"),
        User(firstname: "Monkey 1", lastname: "Monkey", nickname: "monkey_8", age: 7, gender: .male, avatar: "image_8"),
        User(firstname: "Monkey 1", lastname: "Monkey", nickname: "monkey_2", age: 4, gender: .female, avatar: "image_2"),
        User(firstname: "Monkey 1", lastname: "Monkey", nickname: "monkey_3", age: 2, gender: .male, avatar: "image_3"),
        User(firstname: "Monkey 1", lastname: "Monkey", nickname: "monkey_8", age: 7, gender: .male, avatar: "image_8"),
        User(firstname: "Monkey 1", lastname: "Monkey", nickname: "monkey_4", age: 5, gender: .male, avatar: "image_4"),
        User(firstname: "Monkey 1", lastname: "Monkey", nickname: "monkey_5", age: 1, gender: .female, avatar: "image_5"),
        User(firstname: "Monkey 1", lastname: "Monkey", nickname: "monkey_6", age: 3, gender: .female, avatar: "image_6"),
        User(firstname: "Monkey 1", lastname: "Monkey", nickname: "monkey_3", age: 2, gender: .male, avatar: "image_3"),
        User(firstname: "Monkey 1", lastname: "Monkey", nickname: "monkey_9", age: 4, gender: .male, avatar: "image_9"),
        User(firstname: "Monkey 1", lastname: "Monkey", nickname: "monkey_7", age: 7, gender: .male, avatar: "image_7"),
        User(firstname: "Monkey 1", lastname: "Monkey", nickname: "monkey_4", age: 5, gender: .male, avatar: "image_4"),
        User(firstname: "Monkey 1", lastname: "Monkey", nickname: "monkey_8", age: 7, gender: .male, avatar: "image_8"),
        User(firstname: "Monkey 1", lastname: "Monkey", nickname: "monkey_5", age: 1, gender: .female, avatar: "image_5"),
        User(firstname: "Monkey 1", lastname: "Monkey", nickname: "monkey_6", age: 3, gender: .female, avatar: "image_6"),
    ]
    let images: [String] = ["image_2", "image_9", "image_3", "image_5", "image_0", "image_4", "image_8", "image_1", "image_6", "image_7"]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ScrollView(.horizontal, showsIndicators: false) {
                    
//                    LazyHStack(spacing: 12) {
                    HStack(spacing: 12) {
                        ForEach(avatars, id: \.self) { user in
                            StoryView(avatar: user.avatar, nickname: user.nickname ?? "")
                        }
                    }
                    .padding([.horizontal, .top], 8)
                }
                
                Divider()
                
                PostHeaderView(avatar: "image_2", nickname: "monkey_1")
                
                PostSwiperView(images: images)
                
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
                            Image("Logo")
                            
                            AdaptiveView {
                                Image("ArrowDown").padding(.bottom, 12)
                            } darkView: {
                                Image("ArrowDown").padding(.bottom, 18)
                            }
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
        HomeView()
            .previewDevice("iPhone 8")
    }
}
