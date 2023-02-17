//
//  PostSwiperView.swift
//  MyInstagram
//
//  Created by Anthony Albertini on 16/02/2023.
//

import SwiftUI

struct PostSwiperView: View {
    @State var selection = 0
    let images: [String]

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

            HStack(spacing: 6) {
                ForEach(0..<images.count, id: \.self) { index in
                    Circle()
                        .fill(selection == index ? Color.blue : Color.gray)
                        .frame(width: 8, height: 8)
                }
            }

        }
    }
}

struct PostSwiperView_Previews: PreviewProvider {
    static var previews: some View {
        let images: [String] = ["image_2", "image_9", "image_3", "image_5", "image_0", "image_4", "image_8", "image_1", "image_6", "image_7"]

        PostSwiperView(images: images)
    }
}
