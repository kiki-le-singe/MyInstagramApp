//
//  HomeView.swift
//  MyInstagram
//
//  Created by Anthony Albertini on 29/10/2022.
//

import SwiftUI

struct HomeView: View {
    var colors: [Color] = [.red, .blue, .green, .gray, .pink, .yellow, .orange, .purple]
    
    var body: some View {
        NavigationStack {
            ScrollView {
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
