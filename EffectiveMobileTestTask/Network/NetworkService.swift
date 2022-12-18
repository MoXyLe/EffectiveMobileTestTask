//
//  NetworkService.swift
//  EffectiveMobileTestTask
//
//  Created by Виктор Шималин on 12.12.2022.
//

import Foundation

final class NetworkService {
    private let urlSession: URLSession = .shared
    private let mainURL: String = "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175"
    private let detailURL: String = "https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5"
    private let cartURL: String = "https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149"
    
    static let shared = NetworkService()
    
    private init() {}
    
    func getMain(completionHandler: @escaping (HomeResponse?) -> ()) {
        guard let url = URL(string: mainURL) else {
            completionHandler(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            
            if let data = data, error == nil {
                do {
                    let homeResponse = try JSONDecoder().decode(HomeResponse.self, from: data)
                    completionHandler(homeResponse)
                } catch {
                    completionHandler(nil)
                }
            } else {
                completionHandler(nil)
            }
        }
        
        task.resume()
    }
    
    func getProductDetails(completionHandler: @escaping (ProductDetailsResponse?) -> ()) {
        guard let url = URL(string: detailURL) else {
            completionHandler(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            
            if let data = data, error == nil {
                do {
                    let productDetailResponse = try JSONDecoder().decode(ProductDetailsResponse.self, from: data)
                    completionHandler(productDetailResponse)
                } catch {
                    completionHandler(nil)
                }
            } else {
                completionHandler(nil)
            }
        }
        
        task.resume()
    }
    
    func getCart(completionHandler: @escaping (CartResponse?) -> ()) {
        guard let url = URL(string: cartURL) else {
            completionHandler(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            
            if let data = data, error == nil {
                do {
                    let productDetailResponse = try JSONDecoder().decode(CartResponse.self, from: data)
                    completionHandler(productDetailResponse)
                } catch {
                    completionHandler(nil)
                }
            } else {
                completionHandler(nil)
            }
        }
        
        task.resume()
    }
}
