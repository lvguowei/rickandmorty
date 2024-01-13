//
//  RMLocation.swift
//  RickAndMorty
//
//  Created by Guowei Lv on 10.1.2024.
//

import Foundation

struct RMLocation: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}
