//
//  RMSettingsCellViewModel.swift
//  RickAndMorty
//
//  Created by Guowei Lv on 9.4.2024.
//

import UIKit

struct RMSettingsCellViewModel: Identifiable {

    let id = UUID()

    public let type: RMSettingsOption
    public let onTapHandler: (RMSettingsOption) -> Void

    // MARK: - init

    init(type: RMSettingsOption, onTapHandler: @escaping (RMSettingsOption) -> Void) {
        self.type = type
        self.onTapHandler = onTapHandler
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
