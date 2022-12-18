//
//  ProductDetailsTopInfoView.swift
//  EffectiveMobileTestTask
//
//  Created by Виктор Шималин on 18.12.2022.
//

import SwiftUI

struct ProductDetailsTopInfoView: View {
    
    @StateObject var viewModel: ProductDetailsViewModel
    
    var body: some View {
        HStack(alignment: .top) {
            VStack {
                Text(viewModel.productDetailsResponse?.title ?? "")
                    .fixedSize(horizontal: false, vertical: true)
                    .minimumScaleFactor(0.1)
                    .foregroundColor(Color("DarkBlue"))
                    .lineLimit(1)
                    .font(MarkPro(style: .medium, size: 24).font)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    ForEach(0..<Int(round(viewModel.productDetailsResponse!.rating)), id: \.self) { _ in
                        Image("Star")
                    }
                }
                .padding(.top, -10)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            Button(action: {}) {
                Image("HeartWhite")
                    .renderingMode(.template)
                    .frame(width: 37, height: 37)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("DarkBlue")))
                    .foregroundColor(.white)
            }
            .buttonStyle(.plain)
        }
        .padding(.top, 28)
        .padding(.horizontal, 37)
    }
}

struct ProductDetailsTopInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsTopInfoView(viewModel: ProductDetailsViewModel())
    }
}
