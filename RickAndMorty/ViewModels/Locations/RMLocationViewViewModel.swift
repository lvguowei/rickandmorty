//
//  RMLocationViewViewModel.swift
//  RickAndMorty
//
//  Created by Guowei Lv on 21.4.2024.
//

import Foundation

protocol RMLocationViewViewModelDelegate: AnyObject {
    func didFetchInitialLocations()

}

final class RMLocationViewViewModel {

    weak var delegate: RMLocationViewViewModelDelegate?

    private var locations: [RMLocation] = [] {
        didSet {
            for location in locations {
                let cellViewModel = RMLocationTableViewCellViewModel(location: location)

                if !cellViewModels.contains(cellViewModel) {
                    cellViewModels.append(cellViewModel)

                }
            }
        }
    }

    // Location response info
    private var apiInfo: RMGetAllLocationsResponse.Info?

    var cellViewModels: [RMLocationTableViewCellViewModel] = []

    init() {

    }

    public func fetchLocations() {
        RMService.shared.execute(.listLocationsRequest, expecting: RMGetAllLocationsResponse.self) {
            [weak self] result in
            switch result {
                case .success(let model):
                    self?.apiInfo = model.info
                    self?.locations = model.results
                    DispatchQueue.main.async {
                        self?.delegate?.didFetchInitialLocations()
                    }
                    break
                case .failure(_):
                    break
            }
        }
    }

    private var hasMoreResults: Bool = false
}
