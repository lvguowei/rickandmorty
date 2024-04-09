//
//  RMSettingsOption.swift
//  RickAndMorty
//
//  Created by Guowei Lv on 9.4.2024.
//

import UIKit

enum RMSettingsOption: CaseIterable {
    case rateApp
    case contactUs
    case terms
    case privacy
    case apiReference
    case viewSeries
    case viewCode

    var displayTitle: String {
        switch self {

            case .rateApp:
                return "Rate App"
            case .contactUs:
                return "Contact Us"
            case .terms:
                return "Terms of Services"

            case .privacy:
                return "Privacy"
            case .apiReference:
                return "API Reference"
            case .viewSeries:
                return "View Video Series"
            case .viewCode:
                return "View App Code"
        }

    }

    var iconImage: UIImage? {
        switch self {

            case .rateApp:
                return UIImage(systemName: "star.fill")
            case .contactUs:
                return UIImage(systemName: "paperplane")
            case .terms:
                return UIImage(systemName: "doc")
            case .privacy:
                return UIImage(systemName: "lock")
            case .apiReference:
                return UIImage(systemName: "list.clipboard")
            case .viewSeries:
                return UIImage(systemName: "tv.fill")
            case .viewCode:
                return UIImage(systemName: "hammer.fill")
        }
    }

    var iconContainerColor: UIColor {
        switch self {

            case .rateApp:
                return .systemRed
            case .contactUs:
                return .systemYellow
            case .terms:
                return .systemPink
            case .privacy:
                return .systemOrange
            case .apiReference:
                return .systemTeal
            case .viewSeries:
                return .systemBlue
            case .viewCode:
                return .systemGray
        }
    }
}
