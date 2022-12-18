//
//  ProductDetailsBottomInfoView.swift
//  EffectiveMobileTestTask
//
//  Created by Виктор Шималин on 18.12.2022.
//

import SwiftUI

struct ProductDetailsBottomInfoView: View {
    
    @StateObject var viewModel: ProductDetailsViewModel
    
    var body: some View {
        HStack {
            Text("Select color and capacity")
                .font(MarkPro(style: .medium, size: 16).font)
                .foregroundColor(Color("DarkBlue"))
            
            Spacer()
        }
        .padding(.top, 10)
        .padding(.horizontal, 35)
        
        HStack {
            HStack {
                ForEach(0..<viewModel.productDetailsResponse!.color.count, id: \.self) { i in
                    Button(action: {viewModel.selectedColor = i}) {
                        ZStack {
                            Circle()
                                .fill(Color(red: Double(UInt32(viewModel.productDetailsResponse!.color[i].dropFirst(1).dropLast(4), radix: 16)!) / 255.0, green: Double(UInt32(viewModel.productDetailsResponse!.color[i].dropFirst(3).dropLast(2), radix: 16)!) / 255.0, blue: Double(UInt32(viewModel.productDetailsResponse!.color[i].dropFirst(5), radix: 16)!) / 255.0))
                                .frame(width: 39, height: 39)
                            if (i == viewModel.selectedColor) {
                                Image("Selected")
                            }
                        }
                    }
                    .padding(.trailing, 10)
                    .buttonStyle(.plain)
                }
            }
            
            Spacer()
            
            HStack {
                ForEach(0..<viewModel.productDetailsResponse!.capacity.count, id: \.self) { i in
                    if (i == viewModel.selectedCapacity) {
                        Button(action: {viewModel.selectedCapacity = i}) {
                            Text(viewModel.productDetailsResponse!.capacity[i] + " GB")
                                .font(MarkPro(style: .bold, size: 13).font)
                                .foregroundColor(.white)
                                .padding(.all, 10)
                        }
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("Orange")))
                        .buttonStyle(.plain)
                        .padding(.trailing, 10)
                    } else {
                        Button(action: {viewModel.selectedCapacity = i}) {
                            Text(viewModel.productDetailsResponse!.capacity[i] + " GB")
                                .font(MarkPro(style: .bold, size: 13).font)
                                .foregroundColor(Color("GreyText"))
                                .padding(.all, 10)
                        }
                        .buttonStyle(.plain)
                        .padding(.trailing, 10)
                    }
                }
            }
        }
        .padding(.top, 5)
        .padding(.horizontal, 35)
        
        Button(action: {}) {
            HStack {
                Text("Add to Cart")
                    .font(MarkPro(style: .bold, size: 20).font)
                    .foregroundColor(.white)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity)
                
                Spacer()
                
                Text("$\(viewModel.productDetailsResponse!.price)")
                    .font(MarkPro(style: .bold, size: 20).font)
                    .foregroundColor(.white)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity)
            }
            .frame(height: 54)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color("Orange")))
        }
        .padding(.top, 20)
        .padding(.horizontal, 30)
        .buttonStyle(.plain)
    }
}

struct ProductDetailsBottomInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsBottomInfoView(viewModel: ProductDetailsViewModel())
    }
}
