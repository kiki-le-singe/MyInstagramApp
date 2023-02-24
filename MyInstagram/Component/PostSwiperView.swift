//
//  PostSwiperView.swift
//  MyInstagram
//
//  Created by Anthony Albertini on 16/02/2023.
//

import SwiftUI

struct PostSwiperView: View {
    @State var selection = 0
    @State var previousSelection = 0
    @State var currentSelection = 0
    @State var offsetY: CGFloat = 0
    @State var offsetX: CGFloat = 0
    @State var circleSize: CGFloat = 6.5
    @State var currentCircleSize: CGFloat = 8
    
    let images: [String]
    let frameWidth: CGFloat = 47
    let spacingBetweenCircles: CGFloat = 3

    var body: some View {
        let imagesCount: Int = images.count
        let animationOffsetX: CGFloat = circleSize + spacingBetweenCircles

        VStack {
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
            .frame(height: 300)
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
            
            HStack(spacing: spacingBetweenCircles) {
                ForEach(0..<imagesCount, id: \.self) { index in
                    Circle()
                        .fill(selection == index ? Color.blue : Color.gray)
                        .frame(width: currentSelection == index ? currentCircleSize : circleSize, height: currentSelection == index ? currentCircleSize : circleSize)
                        .animation(.spring(), value: currentSelection)
                }
            }
            .offset(x: offsetX, y: offsetY)
            .frame(width: frameWidth, alignment: imagesCount >= 5 ? .topLeading : .center)
            .clipped()
        }
    }
}

struct PostSwiperView_Previews: PreviewProvider {
    static var previews: some View {
        let images: [String] = ["image_2", "image_9", "image_3", "image_5", "image_0", "image_4", "image_8", "image_1", "image_6", "image_7"]

        PostSwiperView(images: images)
    }
}
