//
//  CartBottomView.swift
//  EffectiveMobileTestTask
//
//  Created by Виктор Шималин on 18.12.2022.
//

import SwiftUI

struct CartBottomView: View {
    
    @StateObject var viewModel: CartViewModel
    
    var body: some View {
        if viewModel.cartResponse != nil {
            
            VStack {
                Spacer()
                
                VStack {
                    
                    Divider()
                        .frame(height: 2)
                        .overlay(.white.opacity(0.25))
                        .padding(.horizontal, 4)
                        .padding(.bottom, 5)
                    
                    HStack {
                        Text("Total\nDelivery")
                            .font(MarkPro(style: .normal, size: 15).font)
                            .foregroundColor(.white)
                            .padding(.leading, 50)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(12)
                        
                        Spacer()
                        
                        Text("$\(viewModel.total) us\n\(viewModel.cartResponse!.delivery)")
                            .font(MarkPro(style: .bold, size: 15).font)
                            .foregroundColor(.white)
                            .padding(.trailing, 50)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(12)
                    }
                    .padding(.bottom, 15)
                    
                    Divider()
                        .frame(height: 1)
                        .overlay(.white.opacity(0.2))
                        .padding(.horizontal, 4)
                    
                    Button(action: {}) {
                        HStack {
                            Text("Checkout")
                                .font(MarkPro(style: .bold, size: 20).font)
                                .foregroundColor(.white)
                                .lineLimit(1)
                                .frame(maxWidth: .infinity)
                        }
                        .frame(height: 54)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("Orange")))
                    }
                    .padding(.vertical, 20)
                    .padding(.horizontal, 44)
                    .buttonStyle(.plain)
                }
                .background(Color("DarkBlue"))
            }
            .ignoresSafeArea()
        }
    }
}

struct CartBottomView_Previews: PreviewProvider {
    static var previews: some View {
        CartBottomView(viewModel: CartViewModel())
    }
}
