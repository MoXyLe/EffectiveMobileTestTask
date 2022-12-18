//
//  ProductDetailsCarouselView.swift
//  EffectiveMobileTestTask
//
//  Created by Виктор Шималин on 18.12.2022.
//

import SwiftUI

struct ProductDetailsCarouselView: View {
    
    @StateObject var viewModel: ProductDetailsViewModel
    
    var body: some View {
        if viewModel.productDetailsResponse != nil {
            GeometryReader { geometry in
                ImageCarouselView(numberOfImages: viewModel.productDetailsResponse!.images.count) {
                    ForEach(0..<viewModel.productDetailsResponse!.images.count, id: \.self) { i in
                        AsyncImage(url: URL(string: viewModel.productDetailsResponse!.images[i])) { image in
                                image
                                    .resizable()
                                    //.scaledToFit()
                                    .padding(.all, 10)
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                        } placeholder: {
                            ProgressView()
                                .frame(width: geometry.size.width, height: geometry.size.height)
                        }
                        .background(.white)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                        .cornerRadius(20)
                    }
                }
            }
            .clipped()
            .padding(.horizontal, 15.0)
            .frame(height: 335, alignment: .center)
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.16), radius: 20, y: 10)
            
        } else {
            RoundedRectangle(cornerRadius: 20)
                .frame(height: 335, alignment: .center)
                .padding(.horizontal, 15.0)
                .clipped()
                .foregroundColor(.white)
        }
    }
}

struct ProductDetailsCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsCarouselView(viewModel: ProductDetailsViewModel())
    }
}
