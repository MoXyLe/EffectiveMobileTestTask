//
//  CartViewModel.swift
//  EffectiveMobileTestTask
//
//  Created by Виктор Шималин on 18.12.2022.
//

import Foundation
import Combine
import SwiftUI

class CartViewModel: ObservableObject {
    
    var total: Int {
        var amount = 0
        guard let products = cartResponse?.basket else {
            return 0
        }
        for i in amountForId.keys {
            if let product = products.first(where: {i == $0.id}) {
                amount += product.price * amountForId[i]!
            }
        }
        return amount
    }
    @Published var amountForId: [Int: Int] = [:]
    @Published var cartResponse: CartResponse?
    @Published var gotError: Bool = false
    @Published var gettingData: Bool = false
    @Published var showAlert: Bool = false
    
    private let networkService = NetworkService.shared
    
    func updateData() {
        showAlert = false
        gettingData = true
        networkService.getCart(completionHandler: { [weak self] (data) in
            if data == nil {
                DispatchQueue.main.async {
                    self?.gotError = true
                    self?.showAlert = true
                }
            } else {
                DispatchQueue.main.async {
                    self?.gotError = false
                    self?.cartResponse = data
                    for i in data!.basket {
                        if let _ = self?.amountForId[i.id] {
                            self?.amountForId[i.id]! += 1
                        } else {
                            self?.amountForId[i.id] = 1
                        }
                    }
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
