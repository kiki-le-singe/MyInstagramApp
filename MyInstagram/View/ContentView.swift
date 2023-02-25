//
//  ContentView.swift
//  MyInstagram
//
//  Created by Anthony Albertini on 29/10/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection, content: {
            Group {
                HomeView().tabItem {
                    Image(systemName: "house")
                }
                .tag(0)
                
                SearchView().tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(1)
                
                ReelView().tabItem {
                    Image(systemName: "play.rectangle")
                }.tag(2)
                
                ShopView().tabItem {
                    Image(systemName: "bag")
                }.tag(3)
                
                ProfileView().tabItem {
                    Image(systemName: "person.crop.circle")
                }.tag(4)
            }
            .foregroundColor(Settings.textColorScheme)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Settings.backgroundColorScheme)
//            .toolbar(.visible, for: .tabBar)
//            .toolbarBackground(Settings.backgroundColorScheme, for: .tabBar)
        })
        .accentColor(Settings.textColorScheme)
        .onAppear() {
//            let appearance = UITabBar.appearance()
            // TabBar color
//            appearance.backgroundColor = UIColor(Settings.backgroundColorScheme)
//            appearance.backgroundColor = UIColor.black
//            appearance.backgroundColor = UIColor(Color.black.opacity(0.5))
            // Unselected Tab Item color
//            appearance.unselectedItemTintColor = UIColor(Settings.textColorScheme.opacity(0.9))
//            appearance.unselectedItemTintColor = UIColor.white
    //        appearance.isOpaque = false
            
            
//                        UITabBar.appearance().unselectedItemTintColor = UIColor(Settings.textColorScheme.opacity(1))
            
            // https://stackoverflow.com/questions/60038183/ios13-uitabbar-tintcolor-for-unselecteditem-not-working
            let tabBar = UITabBar.appearance()
            let tabBarAppearance = UITabBarAppearance()
            
            tabBarAppearance.shadowColor = UIColor(Settings.textColorScheme)
            tabBarAppearance.backgroundColor = UIColor(Settings.backgroundColorScheme)
            tabBarAppearance.stackedLayoutAppearance.normal.iconColor = UIColor(Settings.textColorScheme.opacity(0.8))

            tabBar.standardAppearance = tabBarAppearance
            tabBar.scrollEdgeAppearance = tabBarAppearance

//            UITabBar.appearance().unselectedItemTintColor = UIColor(Settings.textColorScheme.opacity(1))
        }
         
//        .onAppear {
//            let appearance = UITabBarAppearance()
//            appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
//            appearance.backgroundColor = UIColor(Color.orange.opacity(0.2))
//
//            // Use this appearance when scrolling behind the TabView:
//            UITabBar.appearance().standardAppearance = appearance
//            // Use this appearance when scrolled all the way up:
//            UITabBar.appearance().scrollEdgeAppearance = appearance
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewDevice("iPhone 13 Pro")
        ContentView()
            .previewDevice("iPhone 8")
        ContentView()
            .previewDevice("iPad Pro (12.9-inch) (5th generation)")
    }
}
