//
//  RMEpisodeDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Guowei Lv on 16.3.2024.
//

import Foundation

protocol RMEpisodeDetailViewViewModelDelegate: AnyObject {
    func didFetchEpisodeDetails()
}

final class RMEpisodeDetailViewViewModel {
    private let endpointUrl: URL?

    public weak var delegate: RMEpisodeDetailViewViewModelDelegate?

    private var dataTuple: (RMEpisode, [RMCharacter])? {
        didSet {
            delegate?.didFetchEpisodeDetails()
        }
    }

    init(endpointUrl: URL?) {
        self.endpointUrl = endpointUrl
    }

    public func fetchEpisodeData() {
        guard let url = endpointUrl, let request = RMRequest(url: url) else { return }
        RMService.shared.execute(request, expecting: RMEpisode.self) { [weak self] result in
            switch result {
                case .success(let model):
                    self?.fetchRelatedCharacters(episode: model)
                case .failure(_):
                    break
            }
        }
    }

    private func fetchRelatedCharacters(episode: RMEpisode) {
        let characterUrls = episode.characters.compactMap { url in
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
            self.dataTuple = (episode, characters)
        }

    }
}
