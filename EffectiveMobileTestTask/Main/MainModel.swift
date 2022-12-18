//
//  MainModel.swift
//  EffectiveMobileTestTask
//
//  Created by Виктор Шималин on 11.12.2022.
//

import Foundation

struct HomeResponse: Codable {
    var home_store: [HotSale]
    var best_seller: [BestSeller]
}

struct HotSale: Codable, Identifiable {
    var id: Int
    var is_new: Bool?
    var title: String
    var subtitle: String
    var picture: String
    var is_buy: Bool
}

struct BestSeller: Codable, Identifiable {
    var id: Int
    var is_favorites: Bool
    var title: String
    var price_without_discount: Int
    var discount_price: Int
    var picture: String
}

let mainCategories = ["Phones", "Computer", "Health", "Books", "Some", "Some", "Some"]
