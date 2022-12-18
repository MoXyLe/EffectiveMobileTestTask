//
//  MainBottomView.swift
//  EffectiveMobileTestTask
//
//  Created by Виктор Шималин on 17.12.2022.
//

import SwiftUI

struct MainBottomView: View {
    
    @StateObject var viewModel: MainViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack(alignment: .center) {
                HStack {
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 8, height: 8)
                    
                    Text("Explorer")
                        .foregroundColor(.white)
                        .font(MarkPro(style: .bold, size: 15).font)
                        .lineLimit(1)
                        .frame(maxWidth: .infinity)
                        .fixedSize()
                }
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity)
                
                NavigationLink(destination: CartView()) {
                    Image("Cart")
                        .frame(maxWidth: .infinity)
                    // .padding(.horizontal, 20)
                }
                .buttonStyle(.plain)
                
                Button(action: {}) {
                    Image("BottomHeart")
                        .frame(maxWidth: .infinity)
                    //.padding(.horizontal, 20)
                }
                .buttonStyle(.plain)
                
                Button(action: {}) {
                    Image("Profile")
                        .frame(maxWidth: .infinity)
                        //.padding(.horizontal, 20)
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal, 40.0)
            .frame(maxWidth: .infinity)
            .frame(height: 72.0)
            .background(RoundedRectangle(cornerRadius: 30).fill(Color("DarkBlue")))
        }
        .ignoresSafeArea()
    }
}

struct MainBottomView_Previews: PreviewProvider {
    static var previews: some View {
        MainBottomView(viewModel: MainViewModel())
    }
}
