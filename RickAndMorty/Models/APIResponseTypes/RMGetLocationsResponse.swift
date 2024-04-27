//
//  RMGetLocationsResponse.swift
//  RickAndMorty
//
//  Created by Guowei Lv on 26.4.2024.
//

import Foundation

struct RMGetAllLocationsResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    let info: Info
    let results: [RMLocation]
}
