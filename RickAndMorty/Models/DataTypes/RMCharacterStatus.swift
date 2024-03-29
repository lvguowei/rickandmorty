//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by Guowei Lv on 13.1.2024.
//

import Foundation

enum RMCharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"

    var text: String {
        switch self {
            case .alive, .dead:
                return rawValue
            case .unknown:
                return "Unknown"
        }
    }
}
