//
//  MainHotSalesView.swift
//  EffectiveMobileTestTask
//
//  Created by Виктор Шималин on 16.12.2022.
//

import SwiftUI

struct MainHotSalesView: View {
    
    @StateObject var viewModel: MainViewModel
    
    var body: some View {
        
        HStack {
            Text("Hot Sales")
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
        .padding(.top, 15.0)
        
        if viewModel.homeResponse != nil {
            GeometryReader { geometry in
                ImageCarouselView(numberOfImages: viewModel.homeResponse!.home_store.count) {
                    ForEach(viewModel.homeResponse!.home_store) { hotSale in
                        AsyncImage(url: URL(string: hotSale.picture)) { image in
                            ZStack {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                                
                                if hotSale.is_new == true {
                                    ZStack {
                                        Circle()
                                            .frame(width: 27, height: 27)
                                            .foregroundColor(Color("Orange"))
                                        
                                        Text("New")
                                            .font(MarkPro(style: .bold, size: 10).font)
                                            .lineLimit(1)
                                            .foregroundColor(.white)
                                    }
                                    .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height, alignment: .topLeading)
                                    .padding(.leading, 25)
                                    .padding(.top, 14)
                                }
                                
                                Text(hotSale.title)
                                    .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height, alignment: .topLeading)
                                    .font(Font.system(size: 25, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding(.leading, 25)
                                    .padding(.top, 59)
                                    .lineLimit(1)
                                
                                Text(hotSale.subtitle)
                                    .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height, alignment: .topLeading)
                                    .font(Font.system(size: 11, weight: Font.Weight.regular))
                                    .foregroundColor(.white)
                                    .padding(.leading, 25)
                                    .padding(.top, 94)
                                    .lineLimit(1)
                                
                                VStack(alignment: .leading) {
                                    HStack(alignment: .top) {
                                        NavigationLink(destination: ProductDetailsView()) {
                                            ZStack {
                                                Text("Buy now!")
                                                    .font(Font.system(size: 11, weight: .bold))
                                                    .foregroundColor(Color("DarkBlue"))
                                                    .frame(width: 98, height: 23)
                                            }
                                            .background(RoundedRectangle(cornerRadius: 5).fill(.white))
                                        }
                                        
                                        Spacer()
                                    }
                                    .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
                                    .padding(.leading, 25)
                                }
                                .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
                                .padding(.top, 133)
                                
                            }
                            .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
                        } placeholder: {
                            ProgressView()
                                .frame(width: geometry.size.width, height: geometry.size.height)
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                        .cornerRadius(10)
                    }
                }
            }
            .clipped()
            .padding(.horizontal, 15.0)
            .frame(height: 182, alignment: .center)
            .cornerRadius(10)
            
        } else {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 182.0, alignment: .center)
                .padding(.horizontal, 15.0)
                .clipped()
                .foregroundColor(.white)
        }
    }
}

struct MainHotSalesView_Previews: PreviewProvider {
    static var previews: some View {
        MainHotSalesView(viewModel: MainViewModel())
    }
}
