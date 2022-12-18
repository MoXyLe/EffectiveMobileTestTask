//
//  MainFilterView.swift
//  EffectiveMobileTestTask
//
//  Created by Виктор Шималин on 16.12.2022.
//

import SwiftUI

struct MainFilterView: View {
    
    @StateObject var viewModel: MainViewModel
    
    var body: some View {
        
        if viewModel.showFilters {
            VStack {
                HStack {
                    //ZStack {
                    HStack {
                        Button(action: {viewModel.showFilters = false}) {
                            Image("Cross")
                                .frame(width: 37, height: 37)
                                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color("DarkBlue")))
                                .padding(.leading, 44)
                                .padding(.top, 24)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Filter options")
                            .foregroundColor(Color("DarkBlue"))
                            .lineLimit(1)
                            .font(MarkPro(style: .medium, size: 18).font)
                            .padding(.top, 20)
                            .frame(alignment: .center)
                    
                    HStack {
                        Button(action: {viewModel.showFilters = false}) {
                            Text("Done")
                                .font(MarkPro(style: .medium, size: 18).font)
                                .foregroundColor(.white)
                                .frame(width: 86, height: 37)
                                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color("Orange")))
                                .padding(.trailing, 20)
                                .padding(.top, 24)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    //}
                }
                
                HStack {
                    Text("Brand")
                        .font(MarkPro(style: .medium, size: 18).font)
                        .lineLimit(1)
                        .foregroundColor(Color("DarkBlue"))
                }
                .padding(.leading, 44)
                .padding(.top, 30)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                    
                HStack {
                    Text("Samsung")
                        .foregroundColor(Color("DarkBlue"))
                        .lineLimit(1)
                        .padding(.leading, 14.0)
                        .font(MarkPro(style: .normal, size: 18).font)
                    HStack {
                        Image("LineDown")
                            .frame(width: 16, height: 8)
                    }
                    .padding(.trailing, 20.0)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .frame(height: 37, alignment: .trailing)
                .background(.white)
                .overlay {
                    RoundedRectangle(cornerRadius: 5).stroke(Color("GreyFilter"), lineWidth: 1)
                }
                .padding(.leading, 46)
                .padding(.trailing, 31)
                
                HStack {
                    Text("Price")
                        .font(MarkPro(style: .medium, size: 18).font)
                        .lineLimit(1)
                        .foregroundColor(Color("DarkBlue"))
                }
                .padding(.leading, 44)
                .padding(.top, 10)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                    
                HStack {
                    Text("$300 - $500")
                        .foregroundColor(Color("DarkBlue"))
                        .lineLimit(1)
                        .padding(.leading, 14.0)
                        .font(MarkPro(style: .normal, size: 18).font)
                    HStack {
                        Image("LineDown")
                            .frame(width: 16, height: 8)
                    }
                    .padding(.trailing, 20.0)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .frame(height: 37, alignment: .trailing)
                .background(.white)
                .overlay {
                    RoundedRectangle(cornerRadius: 5).stroke(Color("GreyFilter"), lineWidth: 1)
                }
                .padding(.leading, 46)
                .padding(.trailing, 31)
                
                HStack {
                    Text("Size")
                        .font(MarkPro(style: .medium, size: 18).font)
                        .lineLimit(1)
                        .foregroundColor(Color("DarkBlue"))
                }
                .padding(.leading, 44)
                .padding(.top, 10)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                    
                HStack {
                    Text("4.5 to 5.5 inches")
                        .foregroundColor(Color("DarkBlue"))
                        .lineLimit(1)
                        .padding(.leading, 14.0)
                        .font(MarkPro(style: .normal, size: 18).font)
                    HStack {
                        Image("LineDown")
                            .frame(width: 16, height: 8)
                    }
                    .padding(.trailing, 20.0)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .frame(height: 37, alignment: .trailing)
                .background(.white)
                .overlay {
                    RoundedRectangle(cornerRadius: 5).stroke(Color("GreyFilter"), lineWidth: 1)
                }
                .padding(.leading, 46)
                .padding(.trailing, 31)
                    
                    
            }
            .frame(maxWidth: .infinity, alignment: .bottomLeading)
            .padding(.bottom, 20)
            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.white).shadow(color: .black.opacity(0.28), radius: 20, y: -5).edgesIgnoringSafeArea(.bottom))
        }
    }
}

struct MainFilterView_Previews: PreviewProvider {
    static var previews: some View {
        MainFilterView(viewModel: MainViewModel())
    }
}
