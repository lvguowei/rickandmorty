//
//  RMCharacterInfoCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Guowei Lv on 21.2.2024.
//

import UIKit

final class RMCharacterInfoCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RMCharacterInfoCollectionViewCell"

    override init(frame: CGRect) {
        super.init(frame: frame)

    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    private func setUpConstraints() {

    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }

    public func configure(with viewModel: RMCharacterInfoCollectionViewCellViewModel) {

    }
}
