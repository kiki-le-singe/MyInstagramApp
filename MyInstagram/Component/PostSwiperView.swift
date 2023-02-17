//
//  PostSwiperView.swift
//  MyInstagram
//
//  Created by Anthony Albertini on 16/02/2023.
//

import SwiftUI

struct PostSwiperView: View {
    @State var selection = 0
    @State var offsetY: CGFloat = 0
    @State var offsetX: CGFloat = 0
    let images: [String]
    let frameWidth: CGFloat = 56

    var body: some View {
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
            .onChange(of: selection, perform: { index in
                print("coucou")
            })

            HStack(spacing: 6) {
                ForEach(0..<images.count, id: \.self) { index in
                    Circle()
                        .fill(selection == index ? Color.blue : Color.gray)
                        .frame(width: 8, height: 8)
                }
            }
            .offset(x: offsetX, y: offsetY)
            .frame(width: frameWidth, height: 8)
            .border(Color.red)
            .clipped()

        }
        .onAppear {
            offsetX = self.frameWidth - 16
        }
    }
}

struct PostSwiperView_Previews: PreviewProvider {
    static var previews: some View {
        let images: [String] = ["image_2", "image_9", "image_3", "image_5", "image_0", "image_4", "image_8", "image_1", "image_6", "image_7"]

        PostSwiperView(images: images)
    }
}
