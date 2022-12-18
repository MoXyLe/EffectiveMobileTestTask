//
//  MainViewModel.swift
//  EffectiveMobileTestTask
//
//  Created by Виктор Шималин on 12.12.2022.
//

import Foundation
import Combine
import SwiftUI

class MainViewModel: ObservableObject {
    @Published var selectedCategory: Int = 0
    @Published var searchQuery: String = ""
    @Published var homeResponse: HomeResponse?
    @Published var gotError: Bool = false
    @Published var gettingData: Bool = false
    @Published var showAlert: Bool = false
    @Published var showFilters: Bool = false
    
    let networkService = NetworkService.shared
    
    func updateData() {
        showAlert = false
        gettingData = true
        networkService.getMain(completionHandler: { [weak self] (data) in
            if data == nil {
                DispatchQueue.main.async {
                    self?.gotError = true
                    self?.showAlert = true
                }
            } else {
                DispatchQueue.main.async {
                    self?.gotError = false
                    self?.homeResponse = data
                }
            }
        })
        gettingData = false
        return
    }
    
    init() {
        updateData()
    }
}
