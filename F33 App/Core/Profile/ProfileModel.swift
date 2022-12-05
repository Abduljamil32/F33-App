//
//  ProfileModel.swift
//  F33 App
//
//  Created by Abduljamil SwiftCoder on 14/12/22.
//

import Foundation

// MARK: - HomeModel
struct BasketModel: Codable, Identifiable {
    
    let basket: [BasketItem]
    let delivery, id: String
    let total: Int
}

// MARK: - Basket
struct BasketItem: Codable, Identifiable {
    let id: Int
    let images: String
    let price: Int
    let title: String
}
