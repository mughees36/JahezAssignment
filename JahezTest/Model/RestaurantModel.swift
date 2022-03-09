//
//  RestaurantModel.swift
//  JahezTest
//
//  Created by Mughees Mustafa on 08/03/2022.
//

import Foundation
struct RestaurantModel: Codable {
    
    
    let id: Int
    let name: String
    let description: String
    let image: String
    let hasOffer: Bool
    let distance: Double
    let hours: String
    let rating: Double
    
}
