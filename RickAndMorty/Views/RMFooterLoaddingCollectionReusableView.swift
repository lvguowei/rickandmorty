//
//  RMFooterLoaddingCollectionReusableView.swift
//  RickAndMorty
//
//  Created by Guowei Lv on 1.2.2024.
//

import UIKit

class RMFooterLoaddingCollectionReusableView: UICollectionReusableView {
    static let identifier = "RMFooterLoaddingCollectionReusableView"

    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(spinner)
        addConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }

    public func startAnimating() {
        spinner.startAnimating()
    }
}
