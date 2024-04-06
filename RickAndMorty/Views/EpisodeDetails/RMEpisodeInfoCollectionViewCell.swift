//
//  RMEpisodeInfoCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Guowei Lv on 6.4.2024.
//

import UIKit

final class RMEpisodeInfoCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RMEpisodeInfoCollectionViewCell"

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.backgroundColor = .secondarySystemBackground
        setupLayer()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {

    }

    private func setupLayer() {
        layer.cornerRadius = 8
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.secondaryLabel.cgColor
    }

    func configure(with viewModel: RMEpisodeInfoCollectionViewCellViewModel) {

    }
}
