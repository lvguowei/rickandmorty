//
//  RMSearchInputViewViewModel.swift
//  RickAndMorty
//
//  Created by Guowei Lv on 29.4.2024.
//

import Foundation

final class RMSearchInputViewViewModel {

    private let type: RMSearchViewController.Config.`Type`

    enum DynamicOption: String {
        case status = "Status"
        case gender = "Gender"
        case locationType = "Location Type"
        
        var choices: [String] {
            switch self {
                
            case .status:
                return ["alive", "dead", "unknown"]
            case .gender:
                return ["female", "male", "genderless", "unknown"]
            case .locationType:
                return ["Cluster", "Plannet", "Microverse"]
            }
        }
    }

    init(type: RMSearchViewController.Config.`Type`) {
        self.type = type
    }

    // MARK: - public

    public var hasDynamicOptions: Bool {
        switch self.type {

            case .character:
                return true
            case .episode:
                return false
            case .location:
                return true
        }
    }
    
    public var options: [DynamicOption] {
        switch self.type {
            
        case .character:
            return [.status, .gender]
        case .episode:
            return []
        case .location:
            return [.locationType]
        }
    }
    
    public var searchPlaceholderText: String {
        switch self.type {
            
        case .character:
            return "Character Name"
        case .episode:
            return "Episode Title"
        case .location:
            return "Location Name"
        }
    }

}
