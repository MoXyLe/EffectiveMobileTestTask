//
//  ProductDetailsViewModel.swift
//  EffectiveMobileTestTask
//
//  Created by Виктор Шималин on 17.12.2022.
//

import Foundation
import Combine
import SwiftUI

class ProductDetailsViewModel: ObservableObject {
    @Published var selectedCapacity: Int = 0
    @Published var selectedColor: Int = 0
    @Published var selectedSection: Int = 0
    @Published var productDetailsResponse: ProductDetailsResponse?
    @Published var gotError: Bool = false
    @Published var gettingData: Bool = false
    @Published var showAlert: Bool = false
    
    private let networkService = NetworkService.shared
    
    func updateData() {
        showAlert = false
        gettingData = true
        networkService.getProductDetails(completionHandler: { [weak self] (data) in
            if data == nil {
                DispatchQueue.main.async {
                    self?.gotError = true
                    self?.showAlert = true
                }
            } else {
                DispatchQueue.main.async {
                    self?.gotError = false
                    self?.productDetailsResponse = data
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
