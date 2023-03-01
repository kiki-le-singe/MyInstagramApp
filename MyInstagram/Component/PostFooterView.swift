//
//  PostFooterView.swift
//  MyInstagram
//
//  Created by Anthony Albertini on 24/02/2023.
//

import SwiftUI

struct PostFooterView: View {
    @StateObject var animations = Animations()
    @State var countLikes = 0
    let spacingBetweenCircles: CGFloat
    let imagesCount: Int
    let selection: Int
    let currentSelection: Int
    let circleSize: CGFloat
    let currentCircleSize: CGFloat = 8
    let offsetY: CGFloat
    let offsetX: CGFloat
    let frameWidth: CGFloat = 47

    func animateCountLikeText (_ isFilled: Bool) {
        if (isFilled) {
            self.countLikes += 1
        } else {
            self.countLikes -= 1
        }
        animations.scaleEffect()
    }
    
    var body: some View {
        VStack {
            HStack {
                HStack(spacing: 12) {
                    PostFooterIconView(icon: "heart", foregroundColor: Color.red, callbackWithAnimation: animateCountLikeText)
                    PostFooterIconView(icon: "message")
                    PostFooterIconView(icon: "paperplane")
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

                PostFooterIconView(icon: "bookmark")
            }
            .padding(.top, 2)
            
            HStack {                
                Text("\(countLikes) Likes")
                    .foregroundColor(Settings.textColorScheme)
                    .font(.system(size: 13, weight: .semibold))
                    .scaleEffect(animations.scale)
                
                Spacer()
            }
        }
        .padding(.horizontal, 12)
    }
}

struct PostFooterView_Previews: PreviewProvider {
    static var previews: some View {
        let images: [String] = ["image_2", "image_9", "image_3", "image_5", "image_0", "image_4", "image_8", "image_1", "image_6", "image_7"]
        
        PostFooterView(spacingBetweenCircles: 3, imagesCount: images.count, selection: 0, currentSelection: 0, circleSize: 6.5, offsetY: 0, offsetX: 0)
    }
}
