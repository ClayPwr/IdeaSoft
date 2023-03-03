//
//  Item.swift
//  IdeaSoft
//
//  Created by User on 3/1/23.
//

import Foundation

struct Item: Codable {
    let id: String
    let name: String
    let price: Double
    let description: String
    let image_url: String
}
