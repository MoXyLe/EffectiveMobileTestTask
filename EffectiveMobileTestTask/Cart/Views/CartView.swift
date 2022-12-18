//
//  CartView.swift
//  EffectiveMobileTestTask
//
//  Created by Виктор Шималин on 18.12.2022.
//

import SwiftUI

struct CartView: View {
    
    @Environment(\.presentationMode) var presentation
    
    @StateObject private var viewModel = CartViewModel()
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            Color("GreyBackground").ignoresSafeArea()
            
            CartScrollView(viewModel: viewModel)
            
            CartBottomView(viewModel: viewModel)
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
                Text("Add address  ")
                    .font(MarkPro(style: .medium, size: 15).font)
                    .foregroundColor(Color("DarkBlue"))
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack {
                    Button(action: {}) {
                        Image("Geo")
                            .renderingMode(.template)
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

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
