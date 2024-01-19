//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Guowei Lv on 10.1.2024.
//

import UIKit

final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Characters"
        view.backgroundColor = .systemBackground

        let request = RMRequest(
            endpoint: .character,
            pathComponents: ["1"],
            queryParameters: [
                URLQueryItem(name: "name", value: "rick"),
                URLQueryItem(name: "status", value: "alive"),
            ]
        )
        RMService.shared.execute(request, expecting: String.self) { result in
        }
    }
}
 
