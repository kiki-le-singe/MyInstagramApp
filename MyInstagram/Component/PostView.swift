//
//  PostView.swift
//  MyInstagram
//
//  Created by Anthony Albertini on 16/02/2023.
//

import SwiftUI

struct PostView: View {
    @State private var selection = 0
    @State private var previousSelection = 0
    @State private var currentSelection = 0
    @State private var offsetY: CGFloat = 0
    @State private var offsetX: CGFloat = 0
    
    let circleSize: CGFloat = 6.5
    // @TODO: uncomment when the data will come from the API
//    let images: [String]
    @State var images: [String]
    let spacingBetweenCircles: CGFloat = 3

    var body: some View {
        let imagesCount: Int = images.count
        let animationOffsetX: CGFloat = circleSize + spacingBetweenCircles

        VStack {
            PostHeaderView(avatar: "image_2", nickname: "monkey_1")

            TabView(selection: $selection) {
                ForEach(Array(images.enumerated()), id: \.element) { index, image in
                    Image(image)
                        .resizable()
                        .frame(width: .infinity)
                        .aspectRatio(contentMode: .fill)
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: Settings.isPhone() ? 300 : 800)
            .onChange(of: selection, perform: { newSelection in
                
                currentSelection = newSelection
                
                if (imagesCount > 5) {
                    if newSelection > previousSelection {
                        if newSelection >= 4 {
                            // swiped to the right
                            withAnimation {
                                self.offsetX -= animationOffsetX
                            }
                        }
                    } else if newSelection < previousSelection {
                        if newSelection >= 3 {
                            // swiped to the left
                            withAnimation {
                                self.offsetX += animationOffsetX
                            }
                        }
                    }
                    previousSelection = newSelection
                }
            })

            PostFooterView(spacingBetweenCircles: spacingBetweenCircles, imagesCount: imagesCount, selection: selection, currentSelection: currentSelection, circleSize: circleSize, offsetY: offsetY, offsetX: offsetX)
        }
        .onAppear() { // @TODO: remove when the data will come from the API
            self.images = images.shuffled()
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        let images: [String] = ["image_2", "image_9", "image_3", "image_5", "image_0", "image_4", "image_8", "image_1", "image_6", "image_7"]

        PostView(images: images)
        PostView(images: images)
            .previewDevice("iPad Pro (12.9-inch) (6th generation)")
        PostView(images: images)
            .previewDevice("iPhone 8")
    }
}
