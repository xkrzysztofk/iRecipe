//
//  ExampleView.swift
//  iRecipe
//
//  Created by Krzysztof Kozyra on 21/04/2024.
//

import SwiftUI

struct ExampleView: View {
    @ObservedObject var viewModel = ExampleViewModel()
    @State private var showProgress = false
    @State private var showCheckmark = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack(alignment: .bottomTrailing) {
                    CachedImage(urlString: viewModel.meal?.strMealThumb ?? "", width: 300, height: 300)
                        .padding(.top, 24)
                    if showProgress {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            .frame(width: 70, height: 70)
                            .background(Color.green)
                            .clipShape(Circle())
                    } else if showCheckmark {
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .frame(width: 70, height: 70)
                            .foregroundColor(.green)
                    } else {
                        Button {
                            withAnimation {
                                showProgress = true
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                withAnimation {
                                    showProgress = false
                                    showCheckmark = true
                                }
                            }
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 70, height: 70)
                                .foregroundColor(.green)
                        }
                    }
                }
                .frame(width: 300, height: 300)
                .padding(.bottom, 24)
                TagView(tags: viewModel.meal?.tags)
                    .padding(.horizontal, 12)
                    .padding(.bottom, 24)
                HStack {
                    Text("Ingredients:")
                        .font(.largeTitle)
                    Spacer()
                }
                .padding(.leading, 12)
                Divider()
                    .padding(.bottom, 12)
                IngredientCollectionView(ingredients: viewModel.meal?.ingredients ?? [])
                    .padding(.bottom, 36)
                HStack {
                    Text("Instructions:")
                        .font(.largeTitle)
                    Spacer()
                }
                .padding(.leading, 12)
                Divider()
                Text(viewModel.meal?.strInstructions ?? "")
                    .padding(.horizontal, 12)
            }
            .refreshable {
                viewModel.fetch()
                showProgress = false
                showCheckmark = false
            }
            .navigationTitle(viewModel.meal?.strMeal ?? "")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            viewModel.fetch()
        }
    }
 }

#Preview {
    ExampleView()
}
