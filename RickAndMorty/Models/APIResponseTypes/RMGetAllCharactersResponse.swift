//
//  RMGetCharactersResponse.swift
//  RickAndMorty
//
//  Created by Guowei Lv on 22.1.2024.
//

import Foundation

struct RMGetAllCharactersResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    let info: Info
    let results: [RMCharacter]
}
