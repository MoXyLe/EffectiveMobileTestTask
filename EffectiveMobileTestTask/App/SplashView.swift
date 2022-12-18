//
//  SplashView.swift
//  EffectiveMobileTestTask
//
//  Created by Виктор Шималин on 18.12.2022.
//

import SwiftUI

struct SplashView: View {
    
    @StateObject private var viewModel = MainViewModel()
    
    @State var isActive: Bool = false
    @State private var appeared: Bool = false
    
    // Customise your SplashScreen here
    var body: some View {
        if isActive {
            MainView(viewModel: viewModel)
        } else {
            ZStack {
                Color("DarkBlue").ignoresSafeArea()
                
                ZStack {
                    Circle()
                        .foregroundColor(Color("Orange"))
                        .frame(width: 132, height: 132)
                    Text("Ecommerce\nConcept")
                        .font(MarkPro(style: .heavy, size: 30).font)
                        .foregroundColor(.white)
                        .padding(.leading, 66)
                }
                .offset(x: appeared ? 0 : 30)
                .opacity(appeared ? 1 : 0)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        appeared.toggle()
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
