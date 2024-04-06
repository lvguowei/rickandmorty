//
//  RMCharacterInfoCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Guowei Lv on 21.2.2024.
//

import Foundation
import UIKit

final class RMCharacterInfoCollectionViewCellViewModel {

    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSZ"
        formatter.timeZone = .current
        return formatter

    }()

    static let shortDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter

    }()

    private let type: `Type`
    private let value: String

    enum `Type`: String {
        case status
        case gender
        case type
        case species
        case origin
        case created
        case location
        case episodeCount

        var tintColor: UIColor {
            switch self {
                case .status:
                    return .systemBlue
                case .gender:
                    return .systemRed
                case .type:
                    return .systemGray
                case .species:
                    return .systemGreen
                case .origin:
                    return .systemYellow
                case .created:
                    return .systemOrange
                case .location:
                    return .systemMint
                case .episodeCount:
                    return .systemPink
            }
        }

        var displayTitle: String {
            switch self {
                case .status,
                    .gender,
                    .type,
                    .species,
                    .origin,
                    .created,
                    .location:
                    return rawValue.uppercased()
                case .episodeCount:
                    return "EPISODE COUNT"
            }
        }

        var iconImage: UIImage? {
            switch self {
                case .status:
                    return UIImage(systemName: "bell")
                case .gender:
                    return UIImage(systemName: "bell")
                case .type:
                    return UIImage(systemName: "bell")
                case .species:
                    return UIImage(systemName: "bell")
                case .origin:
                    return UIImage(systemName: "bell")
                case .created:
                    return UIImage(systemName: "bell")
                case .location:
                    return UIImage(systemName: "bell")
                case .episodeCount:
                    return UIImage(systemName: "bell")
            }
        }
    }

    public var title: String {
        return type.displayTitle
    }

    public var displayValue: String {
        if value.isEmpty {
            return "None"
        }

        if let date = Self.dateFormatter.date(from: value), type == .created {
            return Self.shortDateFormatter.string(from: date)
        }
        return value
    }

    public var iconImage: UIImage? {
        return type.iconImage
    }

    public var tintColor: UIColor {
        return type.tintColor
    }

    init(value: String, type: `Type`) {
        self.value = value
        self.type = type
    }
}
