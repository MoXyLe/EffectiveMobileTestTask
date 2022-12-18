//
//  ProductDetailsView.swift
//  EffectiveMobileTestTask
//
//  Created by Виктор Шималин on 17.12.2022.
//

import SwiftUI

struct ProductDetailsView: View {
    
    @Environment(\.presentationMode) var presentation
    
    @StateObject private var viewModel = ProductDetailsViewModel()
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            Color("GreyBackground").ignoresSafeArea()
            
            ScrollView {
                
                VStack {
                    
                    ProductDetailsCarouselView(viewModel: viewModel)
                    
                    if viewModel.productDetailsResponse != nil {
                        VStack {
                            
                            ProductDetailsTopInfoView(viewModel: viewModel)
                            
                            ProductDetailsMiddleInfoView(viewModel: viewModel)
                            
                            ProductDetailsBottomInfoView(viewModel: viewModel)
                        }
                        .frame(maxWidth: .infinity, alignment: .bottomLeading)
                        .padding(.bottom, 20)
                        .background(RoundedRectangle(cornerRadius: 30).foregroundColor(.white).shadow(color: .black.opacity(0.1), radius: 20, y: -5))
                    }
                }
                .alert("Couldn't load data", isPresented: $viewModel.showAlert, presenting: viewModel, actions: { model in
                    Button("Try again", action: {model.updateData()})
                })
            }
            .padding(.top, 10)
            .padding(.bottom, -1)
        }
        .preferredColorScheme(.light)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                HStack {
                    Button {
                        self.presentation.wrappedValue.dismiss()
                    } label: {
                        Image("BackButton")
                            .foregroundColor(.white)
                            .frame(width: 37, height: 37)
                    }
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("DarkBlue")))
                    .frame(width: 37, height: 37)
                    .buttonStyle(.plain)
                }
                .padding(.leading, 10)
                .frame(width: 37, height: 37)
            }
            
            ToolbarItem(placement: .principal) {
                Text("Product Details")
                    .font(MarkPro(style: .medium, size: 18).font)
                    .foregroundColor(Color("DarkBlue"))
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack {
                    NavigationLink(destination: CartView()) {
                        Image("Cart")
                            .foregroundColor(.white)
                            .frame(width: 37, height: 37)
                    }
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("Orange")))
                    .frame(width: 37, height: 37)
                    .buttonStyle(.plain)
                }
                .padding(.trailing, 10)
                .frame(width: 37, height: 37)
            }
        }
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView()
    }
}
