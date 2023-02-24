//
//  PostFooterView.swift
//  MyInstagram
//
//  Created by Anthony Albertini on 24/02/2023.
//

import SwiftUI

struct PostFooterView: View {
    let spacingBetweenCircles: CGFloat
    let imagesCount: Int
    let selection: Int
    let currentSelection: Int
    let circleSize: CGFloat
    let currentCircleSize: CGFloat = 8
    let offsetY: CGFloat
    let offsetX: CGFloat
    let frameWidth: CGFloat = 47

    var body: some View {
        HStack {
            HStack(spacing: 12) {
                Image(systemName: "heart")
                Image(systemName: "message")
                Image(systemName: "paperplane")
            }
            
            Spacer()
            
            if (imagesCount > 1){
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
                
                Spacer()
                Spacer()
            }
            
            Image(systemName: "bookmark")
        }
        .padding(.top, 2)
        .padding(.horizontal, 12)
    }
}

struct PostFooterView_Previews: PreviewProvider {
    static var previews: some View {
        let images: [String] = ["image_2", "image_9", "image_3", "image_5", "image_0", "image_4", "image_8", "image_1", "image_6", "image_7"]
        
        PostFooterView(spacingBetweenCircles: 3, imagesCount: images.count, selection: 0, currentSelection: 0, circleSize: 6.5, offsetY: 0, offsetX: 0)
    }
}
