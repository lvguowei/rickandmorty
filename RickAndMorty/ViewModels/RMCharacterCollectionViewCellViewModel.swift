//
//  RMCharacterCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Guowei Lv on 25.1.2024.
//

import Foundation

final class RMCharacterCollectionViewCellViewModel: Hashable, Equatable {

    static func == (
        lhs: RMCharacterCollectionViewCellViewModel, rhs: RMCharacterCollectionViewCellViewModel
    ) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }

    public let characterName: String
    private let characterStatus: RMCharacterStatus
    private let characterImageUrl: URL?

    func hash(into hasher: inout Hasher) {
        hasher.combine(characterName)
        hasher.combine(characterStatus)
        hasher.combine(characterImageUrl)
    }

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
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }

            completion(.success(data))
        }
        task.resume()
    }
}
