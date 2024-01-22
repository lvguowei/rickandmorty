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

        RMService.shared.execute(
            RMRequest.listCharactersRequest, expecting: RMGetAllCharactersResponse.self
        ) { result in
            switch result {
                case .success(let model):
                    print(String(describing: model))
                case .failure(let error):
                    print(String(describing: error))
            }
        }
    }
}
