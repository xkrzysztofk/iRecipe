//
//  CachedImageCircled.swift
//  iRecipe
//
//  Created by Krzysztof Kozyra on 21/04/2024.
//

import Foundation
import SwiftUI
import Nuke
import NukeUI

struct CachedImageCircled: View {
    let urlString: String
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        LazyImage(url: URL(string: urlString)) { state in
            if let image = state.image {
                image
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: width, height: height)
                    .overlay(Circle().stroke(Color.black, lineWidth: 0.7).shadow(radius: 25))
            } else {
                ProgressView()
            }
        }
        .pipeline(ImagePipeline.shared)
    }
}

struct CachedImage: View {
    let urlString: String
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        LazyImage(url: URL(string: urlString)) { state in
            if let image = state.image {
                image
                    .aspectRatio(contentMode: .fill)
            } else {
                ProgressView()
            }
        }
        .pipeline(ImagePipeline.shared)
    }
}
