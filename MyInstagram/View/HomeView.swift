//
//  HomeView.swift
//  MyInstagram
//
//  Created by Anthony Albertini on 29/10/2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        
        
        NavigationView {
            ScrollView {
                //        Image(systemName: "globe")
                //            .imageScale(.large)
                //            .foregroundColor(.accentColor)
                Text("Home View")
            }
            .navigationBarItems(
                leading: Button(action: {
//                    pres.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "hare")
                }),
//                    trailing: Button("Settings", action: {
//                        pres.wrappedValue.dismiss()
//                    })
                trailing: NavigationLink("Settings",
                                   destination: Text("This is the Settings View"))
            )
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
