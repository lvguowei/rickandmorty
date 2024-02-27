//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Guowei Lv on 1.2.2024.
//

import Foundation
import UIKit

final class RMCharacterDetailViewViewModel {
    private let character: RMCharacter

    enum SectionType {
        case photo(viewModel: RMCharacterPhotoCollectionViewCellViewModel)
        case information(viewModels: [RMCharacterInfoCollectionViewCellViewModel])
        case episodes(viewModels: [RMCharacterEpisodeCollectionViewCellViewModel])
    }

    public var sections: [SectionType] = []

    // MARK: - Init
    init(character: RMCharacter) {
        self.character = character
        setUpSections()
    }

    private func setUpSections() {
        sections = [
            .photo(viewModel: .init(imageUrl: URL(string: character.image))),
            .information(viewModels: [
                .init(value: character.status.text, type: .status),
                .init(value: character.gender.rawValue, type: .gender),
                .init(value: character.type, type: .type),
                .init(value: character.species, type: .species),
                .init(value: character.origin.name, type: .origin),
                .init(value: character.location.name, type: .location),
                .init(value: character.created, type: .created),
                .init(value: String(character.episode.count), type: .episodeCount),
            ]),
            .episodes(
                viewModels: character.episode.compactMap {
                    RMCharacterEpisodeCollectionViewCellViewModel(episodeDataUrl: URL(string: $0))
                }),
        ]
    }

    public var title: String {
        character.name.uppercased()
    }

    public var requestUrl: URL? {
        return URL(string: character.url)
    }

    // MARK: - Layouts

    func createEpisodesSectionLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)))

        item.contentInsets = NSDirectionalEdgeInsets(
            top: 10,
            leading: 5,
            bottom: 10,
            trailing: 8)

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.8),
                heightDimension: .absolute(150)),
            subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }

    func createPhotoSectionLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0)
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5)),
            subitems: [item])
        let section = NSCollectionLayoutSection(group: group)

        return section
    }

    func createInfoSectionLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .fractionalHeight(1.0)))

        item.contentInsets = NSDirectionalEdgeInsets(
            top: 2,
            leading: 2,
            bottom: 2,
            trailing: 2)

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(150)),
            subitems: [item, item])
        let section = NSCollectionLayoutSection(group: group)

        return section
    }

}
