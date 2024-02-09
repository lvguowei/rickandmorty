//
//  RMCharacterCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Guowei Lv on 25.1.2024.
//

import Foundation

final class RMCharacterCollectionViewCellViewModel: Hashable, Equatable {

    public let characterName: String
    private let characterStatus: RMCharacterStatus
    private let characterImageUrl: URL?

    init(
        characterName: String,
        characterStatus: RMCharacterStatus,
        characterImageUrl: URL?
    ) {
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageUrl = characterImageUrl
    }

    public var characterStatusText: String {
        return "Status: \(self.characterStatus.text)"
    }

    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        // Abstract to ImageManager
        guard let url = characterImageUrl else {
            completion(.failure(URLError(URLError.badURL)))
            return
        }
        RMImageLoader.shared.downloadImage(url, completion: completion)
    }

    // Mark: - Hashable
    static func == (
        lhs: RMCharacterCollectionViewCellViewModel, rhs: RMCharacterCollectionViewCellViewModel
    ) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(characterName)
        hasher.combine(characterStatus)
        hasher.combine(characterImageUrl)
    }

}
