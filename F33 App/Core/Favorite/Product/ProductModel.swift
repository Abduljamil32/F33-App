//
//  ProductModel.swift
//  F33 App
//
//  Created by Abduljamil SwiftCoder on 16/12/22.
//

import Foundation

// MARK: - ProductModel
struct ProductModel: Codable, Identifiable {
    let cpu, camera: String
    let capacity, color: [String]
    let id: String
    let images: [String]
    let isFavorites: Bool
    let price: Int
    let rating: Double
    let sd, ssd, title: String
}
