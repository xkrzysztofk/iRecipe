//
//  TagView.swift
//  iRecipe
//
//  Created by Krzysztof Kozyra on 23/04/2024.
//

import SwiftUI

struct TagView: View {
    let tags: [String]?
    let columns: [GridItem] = [GridItem(.flexible(minimum: 120, maximum: 200)),
                               GridItem(.flexible(minimum: 120, maximum: 200)),
                               GridItem(.flexible(minimum: 120, maximum: 200))]
    
    var body: some View {
        LazyVGrid(columns: columns, content: {
            ForEach(tags ?? [], id: \.self) { tag in
                RoundedRectangle(cornerSize: CGSize(width: 20,
                                                    height: 10),
                                 style: .circular)
                .foregroundColor(.cyan)
                    .overlay {
                        Text(tag)
                            .foregroundColor(.white)
                            .minimumScaleFactor(0.1)
                    }
                    .frame(height: 25)
            }
        })
    }
}

#Preview {
    TagView(tags: ["Spicy", "Meat", "Alcoholic", "Vegan", "Fast"])
}
