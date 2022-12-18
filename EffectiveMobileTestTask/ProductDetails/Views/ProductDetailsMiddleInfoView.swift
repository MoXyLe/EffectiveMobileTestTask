//
//  ProductDetailsMiddleInfoView.swift
//  EffectiveMobileTestTask
//
//  Created by Виктор Шималин on 18.12.2022.
//

import SwiftUI

struct ProductDetailsMiddleInfoView: View {
    
    @StateObject var viewModel: ProductDetailsViewModel
    
    var body: some View {
        HStack {
            Spacer()
            
            Button(action: { viewModel.selectedSection = 0 }) {
                if viewModel.selectedSection != 0 {
                    Text("Shop")
                        .font(MarkPro(style: .normal, size: 20).font)
                        .foregroundColor(.black.opacity(0.5))
                } else {
                    Text("Shop")
                        .font(MarkPro(style: .bold, size: 20).font)
                        .foregroundColor(Color("DarkBlue"))
                        .overlay(alignment: .bottom) {
                            Rectangle().frame(height: 3).offset(y: 8).padding(.horizontal, -10).foregroundColor(Color("Orange"))
                        }
                }
            }
            .buttonStyle(.plain)
            
            Spacer()
            
            Button(action: { viewModel.selectedSection = 1 }) {
                if viewModel.selectedSection != 1 {
                    Text("Details")
                        .font(MarkPro(style: .normal, size: 20).font)
                        .foregroundColor(.black.opacity(0.5))
                } else {
                    Text("Details")
                        .font(MarkPro(style: .bold, size: 20).font)
                        .foregroundColor(Color("DarkBlue"))
                        .overlay(alignment: .bottom) {
                            Rectangle().frame(height: 3).offset(y: 8).padding(.horizontal, -10).foregroundColor(Color("Orange"))
                        }
                }
            }
            .buttonStyle(.plain)
            
            Spacer()
            
            Button(action: { viewModel.selectedSection = 2 }) {
                if viewModel.selectedSection != 2 {
                    Text("Features")
                        .font(MarkPro(style: .normal, size: 20).font)
                        .foregroundColor(.black.opacity(0.5))
                } else {
                    Text("Features")
                        .font(MarkPro(style: .bold, size: 20).font)
                        .foregroundColor(Color("DarkBlue"))
                        .overlay(alignment: .bottom) {
                            Rectangle().frame(height: 3).offset(y: 8).padding(.horizontal, -10).foregroundColor(Color("Orange"))
                        }
                }
            }
            .buttonStyle(.plain)
            
            Spacer()
        }
        .padding(.top, 20)
        
        HStack {
            Spacer()
            
            VStack {
                Image("CPU")
                
                Text(viewModel.productDetailsResponse!.CPU)
                    .font(MarkPro(style: .normal, size: 11).font)
                    .foregroundColor(Color("GreyText"))
            }
            
            Spacer()
            
            VStack {
                Image("Camera")
                
                Text(viewModel.productDetailsResponse!.camera)
                    .font(MarkPro(style: .normal, size: 11).font)
                    .foregroundColor(Color("GreyText"))
            }
            
            Spacer()
            
            VStack {
                Image("RAM")
                
                Text(viewModel.productDetailsResponse!.ssd)
                    .font(MarkPro(style: .normal, size: 11).font)
                    .foregroundColor(Color("GreyText"))
            }
            
            Spacer()
            
            VStack {
                Image("SSD")
                
                Text(viewModel.productDetailsResponse!.sd)
                    .font(MarkPro(style: .normal, size: 11).font)
                    .foregroundColor(Color("GreyText"))
            }
            
            Spacer()
        }
        .padding(.top, 10)
    }
}

struct ProductDetailsMiddleInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsMiddleInfoView(viewModel: ProductDetailsViewModel())
    }
}
