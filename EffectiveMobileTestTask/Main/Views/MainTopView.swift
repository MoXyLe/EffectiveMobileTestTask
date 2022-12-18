//
//  MainTopView.swift
//  EffectiveMobileTestTask
//
//  Created by Виктор Шималин on 16.12.2022.
//

import SwiftUI

struct MainTopView: View {
    
    @StateObject var viewModel: MainViewModel
    
    var body: some View {
        
        ZStack(alignment: .trailing) {
            HStack {
                Button(action: {}, label: {
                    Image("Geo")
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                })
                Text("Zihuatanejo, Gro")
                    .foregroundColor(Color("DarkBlue"))
                    .lineLimit(1)
                    .padding(.leading, 5.0)
                    .font(MarkPro(style: .medium, size: 15).font)
                    .layoutPriority(1)
                Image("LineDown")
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            }
            Button(action: { withAnimation(.linear(duration: 0.2)) {
                viewModel.showFilters = true
            }
            }, label: {
                Image("Filters")
                    .padding(.trailing, 35.0)
            })
        }
        
        HStack {
            Text("Select Category")
                .foregroundColor(Color("DarkBlue"))
                .font(MarkPro(style: .bold, size: 25).font)
                .lineLimit(1)
                .padding(.leading, 17.0)
                .frame(maxWidth: .infinity, alignment: .leading)
            Button(action: {}, label: {
                Text("view all")
                    .font(MarkPro(style: .normal, size: 15).font)
                    .lineLimit(1)
                    .padding(.trailing, 33.0)
                    .frame(alignment: .trailing)
                    .foregroundColor(Color("Orange"))
            })
        }
        .padding(.top, 5.0)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 23) {
                ForEach(0..<mainCategories.count, id: \.self) { index in
                    if index == viewModel.selectedCategory {
                        Button(action: {viewModel.selectedCategory = index}) {
                            VStack {
                                Image(mainCategories[index])
                                    .renderingMode(.template)
                                    .frame(width: 71, height: 71)
                                    .background(Color("Orange"))
                                    .foregroundColor(.white)
                                    .clipShape(Circle())
                                Text(mainCategories[index])
                                    .font(MarkPro(style: .medium, size: 12).font)
                                    .foregroundColor(Color("Orange"))
                            }
                        }
                    } else {
                        Button(action: {viewModel.selectedCategory = index}) {
                            VStack {
                                Image(mainCategories[index])
                                    .renderingMode(.template)
                                    .frame(width: 71, height: 71)
                                    .background(.white)
                                    .foregroundColor(Color("GreyIcon"))
                                    .clipShape(Circle())
                                Text(mainCategories[index])
                                    .font(MarkPro(style: .medium, size: 12).font)
                                    .foregroundColor(Color("DarkBlue"))
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 27.0)
        }
        .padding(.top, 8.0)
        
        HStack {
            HStack {
                Image("Search")
                    .padding(.leading, 24.0)
                ZStack(alignment: .leading) {
                    if viewModel.searchQuery.isEmpty {
                        Text("Search")
                            .foregroundColor(Color("DarkBlue").opacity(0.58))
                            .padding(.leading, 5.0)
                            .font(MarkPro(style: .normal, size: 12).font)
                    }
                    TextField("", text: $viewModel.searchQuery)
                        //.foregroundColor(Color("DarkBlue").opacity(0.58))
                        .padding(.leading, 5.0)
                        .font(MarkPro(style: .normal, size: 12).font)
                }
            }
            .frame(height: 34.0)
            .background(.white)
            .cornerRadius(50)
            
            Button(action: {}, label: {
                Image("SearchButton")
                    .frame(width: 34, height: 34)
                    .background(Color("Orange"))
                    .clipShape(Circle())
                    .padding(.leading, 5.0)
                    .padding(.trailing, 37.0)
            })
        }
        .padding(.top, 26.0)
        .padding(.leading, 32.0)
    }
}

struct MainTopView_Previews: PreviewProvider {
    static var previews: some View {
        MainTopView(viewModel: MainViewModel())
    }
}
