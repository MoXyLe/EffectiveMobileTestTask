//
//  CartScrollView.swift
//  EffectiveMobileTestTask
//
//  Created by Виктор Шималин on 18.12.2022.
//

import SwiftUI

struct CartScrollView: View {
    
    @StateObject var viewModel: CartViewModel
    
    var body: some View {
        ScrollView {
            
            VStack {
                Text("My Cart")
                    .font(MarkPro(style: .bold, size: 35).font)
                    .foregroundColor(Color("DarkBlue"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 40)
                    .padding(.top, 30)
                
                if viewModel.cartResponse != nil {
                    VStack {
                        VStack {
                            ForEach(viewModel.cartResponse!.basket) { product in
                                HStack {
                                    AsyncImage(url: URL(string: product.images)) { image in
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            //.padding(5)
                                            .frame(width: 88, height: 88)
                                            .cornerRadius(10)
                                        
                                    } placeholder: {
                                        ProgressView()
                                            .frame(width: 88, height: 88)
                                    }
                                    .frame(width: 88, height: 88)
                                    .background(.white)
                                    .cornerRadius(10)
                                    .clipped()
                                    
                                    VStack(alignment: .leading) {
                                        Text(product.title)
                                            .lineLimit(2)
                                            .font(MarkPro(style: .medium, size: 20).font)
                                            .foregroundColor(.white)
                                        
                                        Text("$\(product.price)")
                                            .lineLimit(1)
                                            .font(MarkPro(style: .medium, size: 20).font)
                                            .foregroundColor(Color("Orange"))
                                    }
                                    .frame(maxWidth: .infinity)
                                    
                                    VStack (alignment: .center) {
                                        if (viewModel.amountForId[product.id]! <= 1) {
                                            Button(action: {}) {
                                                Image("Minus")
                                            }
                                            .padding(.top, 7)
                                            .buttonStyle(.plain)
                                            .frame(width: 26, height: 22)
                                            .disabled(true)
                                        } else {
                                            Button(action: {viewModel.amountForId[product.id]! -= 1}) {
                                                Image("Minus")
                                            }
                                            .padding(.top, 7)
                                            .buttonStyle(.plain)
                                            .frame(width: 26, height: 22)
                                        }
                                        
                                        Text(String(viewModel.amountForId[product.id] ?? 1))
                                            .font(MarkPro(style: .medium, size: 20).font)
                                            .foregroundColor(.white)
                                            .frame(width: 26, height: 23)
                                        
                                        if (viewModel.amountForId[product.id]! >= 9) {
                                            Button(action: {}) {
                                                Image("Plus")
                                            }
                                            .buttonStyle(.plain)
                                            .frame(width: 26, height: 22)
                                            .padding(.bottom, 7)
                                            .disabled(true)
                                        } else {
                                            Button(action: {viewModel.amountForId[product.id]! += 1}) {
                                                Image("Plus")
                                            }
                                            .buttonStyle(.plain)
                                            .frame(width: 26, height: 22)
                                            .padding(.bottom, 7)
                                        }
                                    }
                                    .background(Color("GreyCart"))
                                    .cornerRadius(26)
                                    .frame(width: 26, height: 68)
                                    
                                    Button(action: {viewModel.cartResponse!.basket.removeAll(where: { product.id == $0.id })}) {
                                        Image("Delete")
                                    }
                                    .buttonStyle(.plain)
                                    .padding(.leading, 10)
                                }
                                .frame(height: 88)
                                .padding(.vertical, 15)
                            }
                        }
                        .padding(.vertical, 40)
                        .padding(.horizontal, 20)
                        
                        if (viewModel.cartResponse!.basket.count < 5) {
                            Spacer()
                                .frame(height: 100 * CGFloat(5 - viewModel.cartResponse!.basket.count))
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                    .padding(.bottom, 20)
                    .background(RoundedRectangle(cornerRadius: 30).foregroundColor(Color("DarkBlue")).shadow(color: .black.opacity(0.1), radius: 20, y: -5))
                }
            }
            .alert("Couldn't load data", isPresented: $viewModel.showAlert, presenting: viewModel, actions: { model in
                Button("Try again", action: {model.updateData()})
            })
        }
        .padding(.vertical, -1)
    }
}

struct CartScrollView_Previews: PreviewProvider {
    static var previews: some View {
        CartScrollView(viewModel: CartViewModel())
    }
}
