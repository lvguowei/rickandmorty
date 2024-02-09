//
//  RMCharacterDetailViewModel.swift
//  RickAndMorty
//
//  Created by Guowei Lv on 1.2.2024.
//

import UIKit

final class RMCharacterDetailView: UIView {

    private var collectionView: UICollectionView?

    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemPurple
        translatesAutoresizingMaskIntoConstraints = false
        self.collectionView = createCollectionView()
        addSubViews(collectionView!, spinner)
        addConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    private func addConstraints() {
        guard let collectionView = collectionView else { return }

        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),

            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    private func createCollectionView() -> UICollectionView {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            return self.createSection(for: sectionIndex)
        }
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }

    private func createSection(for sectionIndex: Int) -> NSCollectionLayoutSection {

    }

}
