//
//  CartModel.swift
//  EffectiveMobileTestTask
//
//  Created by Виктор Шималин on 11.12.2022.
//

import Foundation

struct CartResponse: Codable {
    var basket: [Product]
    var delivery: String
    var id: String
    var total: Int
}

struct Product: Codable, Identifiable {
    var id: Int
    var images: String
    var price: Int
    var title: String
}
