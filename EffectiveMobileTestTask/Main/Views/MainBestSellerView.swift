//
//  MainBestSellerView.swift
//  EffectiveMobileTestTask
//
//  Created by Виктор Шималин on 16.12.2022.
//

import SwiftUI

struct MainBestSellerView: View {
    
    @StateObject var viewModel: MainViewModel
    
    var body: some View {
        
        HStack {
            Text("Best Seller")
                .foregroundColor(Color("DarkBlue"))
                .font(MarkPro(style: .bold, size: 25).font)
                .lineLimit(1)
                .padding(.leading, 17.0)
                .frame(maxWidth: .infinity, alignment: .leading)
            Button(action: {}, label: {
                Text("see more")
                    .font(MarkPro(style: .normal, size: 15).font)
                    .lineLimit(1)
                    .padding(.trailing, 33.0)
                    .frame(alignment: .trailing)
                    .foregroundColor(Color("Orange"))
            })
        }
        .padding(.top, 5.0)
        
        if viewModel.homeResponse != nil {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], alignment: .center, spacing: 12) {
                ForEach(viewModel.homeResponse!.best_seller) { bestSeller in
                    NavigationLink(destination: ProductDetailsView()) {
                        VStack {
                            AsyncImage(url: URL(string: bestSeller.picture)) { image in
                                ZStack {
                                    image
                                        .resizable()
                                        .scaledToFit()
                                    ZStack {
                                        if bestSeller.is_favorites {
                                            Image("HeartOn")
                                                .frame(width: 25, height: 25, alignment: .center)
                                                .background(Circle().fill(.white).shadow(color: .black.opacity(0.15), radius: 20))
                                                .padding(.trailing, 12)
                                                .padding(.top, 10)
                                        } else {
                                            Image("HeartOff")
                                                .frame(width: 25, height: 25, alignment: .center)
                                                .background(Circle().fill(.white).shadow(color: .black.opacity(0.15), radius: 20))
                                                .padding(.trailing, 12)
                                                .padding(.top, 10)
                                        }
                                    }
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                                
                            } placeholder: {
                                ProgressView()
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                            }
                            .clipped()
                            
                            HStack {
                                Text("$\(bestSeller.price_without_discount)")
                                    .foregroundColor(Color("DarkBlue"))
                                    .font(MarkPro(style: .bold, size: 16).font)
                                    .lineLimit(1)
                                    .padding(.leading, 21.0)
                                    .frame(alignment: .leading)
                                
                                Text("$\(bestSeller.discount_price)")
                                    .font(MarkPro(style: .medium, size: 10).font)
                                    .foregroundColor(Color("GreyText"))
                                    .lineLimit(1)
                                    .strikethrough()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            
                            Text("\(bestSeller.title)")
                                .foregroundColor(Color("DarkBlue"))
                                .font(MarkPro(style: .normal, size: 10).font)
                                .lineLimit(1)
                                .padding(.leading, 21.0)
                                .padding(.bottom, 12)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.white)
                        .cornerRadius(10)
                    }
                }
            }
            .padding(.horizontal, 14.0)
        }
    }
}

struct MainBestSellerView_Previews: PreviewProvider {
    static var previews: some View {
        MainBestSellerView(viewModel: MainViewModel())
    }
}
