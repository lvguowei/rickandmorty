//
//  RMLocationViewViewModel.swift
//  RickAndMorty
//
//  Created by Guowei Lv on 21.4.2024.
//

import Foundation

final class RMLocationViewViewModel {

    private var locations: [RMLocation] = []

    // Location response info

    private var cellViewModels: [String] = []

    init() {

    }

    public func fetchLocations() {
        RMService.shared.execute(.listLocationsRequest, expecting: String.self) { result in
            switch result {

                case .success(let success):
                    break
                case .failure(_):
                    break
            }
        }
    }

    private var hasMoreResults: Bool = false
}
