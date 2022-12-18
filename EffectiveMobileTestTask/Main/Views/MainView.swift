//
//  ContentView.swift
//  EffectiveMobileTestTask
//
//  Created by Виктор Шималин on 11.12.2022.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel: MainViewModel
    
    var body: some View {
        
        NavigationView {
            
            ZStack(alignment: .bottom) {
                
                Color("GreyBackground").ignoresSafeArea()
                
                ScrollView {
                    
                    VStack {
                        
                        MainTopView(viewModel: viewModel)
                        
                        MainHotSalesView(viewModel: viewModel)
                        
                        MainBestSellerView(viewModel: viewModel)
                    }
                    .padding(.bottom, 50)
                    .alert("Couldn't load data", isPresented: $viewModel.showAlert, presenting: viewModel, actions: { model in
                        Button("Try again", action: {model.updateData()})
                    })
                }
                .padding(.vertical, 1)
                
                MainBottomView(viewModel: viewModel)
                
                MainFilterView(viewModel: viewModel)
            }
            .preferredColorScheme(.light)
        }
        .navigationTitle("")
        .toolbar(.hidden, for: .navigationBar)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel())
            //.previewDevice("iPhone 14")
    }
}
