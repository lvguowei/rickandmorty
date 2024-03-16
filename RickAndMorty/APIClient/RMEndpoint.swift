//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Guowei Lv on 13.1.2024.
//

import Foundation

@frozen enum RMEndpoint: String, Hashable, CaseIterable {
    case character
    case location
    case episode
}
