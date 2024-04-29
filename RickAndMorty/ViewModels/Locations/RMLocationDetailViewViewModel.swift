//
//  RMLocationDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Guowei Lv on 28.4.2024.
//

import Foundation

protocol RMLocationDetailViewViewModelDelegate: AnyObject {
    func didFetchLocationDetails()
}

final class RMLocationDetailViewViewModel {
    private let endpointUrl: URL?

    public weak var delegate: RMLocationDetailViewViewModelDelegate?

    private var dataTuple: (location: RMLocation, characters: [RMCharacter])? {
        didSet {
            createCellViewModels()
            delegate?.didFetchLocationDetails()
        }
    }

    public func character(at index: Int) -> RMCharacter? {
        guard let dataTuple = dataTuple else { return nil }
        return dataTuple.characters[index]
    }

    enum SectionType {
        case information(viewModels: [RMEpisodeInfoCollectionViewCellViewModel])
        case characters(viewModel: [RMCharacterCollectionViewCellViewModel])
    }

    public private(set) var cellViewModels: [SectionType] = []

    init(endpointUrl: URL?) {
        self.endpointUrl = endpointUrl
    }

    public func fetchLocationData() {
        guard let url = endpointUrl, let request = RMRequest(url: url) else { return }
        RMService.shared.execute(request, expecting: RMLocation.self) { [weak self] result in
            switch result {
                case .success(let model):
                    self?.fetchRelatedCharacters(location: model)
                case .failure(_):
                    break
            }
        }
    }

    private func createCellViewModels() {

        guard let dataTuple = dataTuple else { return }
        let location = dataTuple.location
        let characters = dataTuple.characters

        var createdString = location.created
        if let date = RMCharacterInfoCollectionViewCellViewModel.dateFormatter.date(
            from: location.created)
        {
            createdString =
                RMCharacterInfoCollectionViewCellViewModel.shortDateFormatter.string(
                    from: date)
        }
        cellViewModels = [
            .information(viewModels: [
                .init(title: "Location Name", value: location.name),
                .init(title: "Type", value: location.type),
                .init(title: "Dimension", value: location.dimension),
                .init(title: "Created", value: createdString),
            ]),
            .characters(
                viewModel: characters.compactMap({ character in
                    return RMCharacterCollectionViewCellViewModel(
                        characterName: character.name, characterStatus: character.status,
                        characterImageUrl: URL(string: character.image))
                })),
        ]
    }

    private func fetchRelatedCharacters(location: RMLocation) {
        let characterUrls = location.residents.compactMap { url in
            return URL(string: url)
        }

        let requests: [RMRequest] = characterUrls.compactMap { url in
            return RMRequest(url: url)
        }

        let group = DispatchGroup()
        var characters: [RMCharacter] = []

        for request in requests {
            group.enter()
            RMService.shared.execute(request, expecting: RMCharacter.self) { result in
                defer {
                    group.leave()
                }
                switch result {
                    case .success(let model):
                        characters.append(model)
                    case .failure(_):
                        break
                }
            }
        }

        group.notify(queue: .main) {
            self.dataTuple = (location, characters)
        }

    }
}
