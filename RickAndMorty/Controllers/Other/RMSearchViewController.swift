//
//  RMSearchViewController.swift
//  RickAndMorty
//
//  Created by Guowei Lv on 2.4.2024.
//

import UIKit

class RMSearchViewController: UIViewController {

    struct Config {
        enum `Type` {
            case character  // name | status | gender
            case episode  // name
            case location  // name | type

            var title: String {
                switch self {
                    case .character:
                        return "Search characters"
                    case .location:
                        return "Search Location"
                    case .episode:
                        return "Search Episode"
                }
            }
        }
        let type: `Type`

    }

    private let config: Config

    // MARK: - Init
    init(config: Config) {
        self.config = config
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = config.type.title
        view.backgroundColor = .systemBackground
    }
}
