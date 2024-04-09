//
//  RMSettingsCellViewModel.swift
//  RickAndMorty
//
//  Created by Guowei Lv on 9.4.2024.
//

import UIKit

struct RMSettingsCellViewModel: Identifiable {

    let id = UUID()

    private let type: RMSettingsOption

    // MARK: - init

    init(type: RMSettingsOption) {
        self.type = type
    }

    // MARK: - public
    public var image: UIImage? {
        type.iconImage
    }

    public var title: String {
        type.displayTitle
    }

    public var iconContainerColor: UIColor {
        type.iconContainerColor
    }

}
