//
//  RMLocationTableViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Guowei Lv on 27.4.2024.
//

import Foundation

struct RMLocationTableViewCellViewModel: Hashable, Equatable {
    static func == (lhs: RMLocationTableViewCellViewModel, rhs: RMLocationTableViewCellViewModel)
        -> Bool
    {
        lhs.hashValue == rhs.hashValue
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(location.id)
        hasher.combine(dimension)
        hasher.combine(type)
    }

    private let location: RMLocation

    init(location: RMLocation) {
        self.location = location
    }

    public var name: String {
        location.name
    }

    public var type: String {
        "Type: " + location.type
    }

    public var dimension: String {
        location.dimension
    }

}
