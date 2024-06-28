//
//  RMSearchViewViewModel.swift
//  RickAndMorty
//
//  Created by Guowei Lv on 29.4.2024.
//

import Foundation

// Show search results
// Show no results view
// api call
final class RMSearchViewViewModel {

    let config: RMSearchViewController.Config

    private var optionMap: [RMSearchInputViewViewModel.DynamicOption: String] = [:]

    private var searchText = ""

    private var optionMapUpdateBlock:
        (((RMSearchInputViewViewModel.DynamicOption, String)) -> Void)?

    // MARK: - Init
    init(config: RMSearchViewController.Config) {
        self.config = config
    }

    // MARK: - Public
    public func set(value: String, for option: RMSearchInputViewViewModel.DynamicOption) {
        optionMap[option] = value
        let tuple = (option, value)
        optionMapUpdateBlock?(tuple)
        print(String(describing: tuple))

    }

    public func set(query text: String) {
        self.searchText = text
    }

    public func registerOptionChangeBlock(
        _ block: @escaping ((RMSearchInputViewViewModel.DynamicOption, String)) -> Void
    ) {
        self.optionMapUpdateBlock = block
    }

    public func executeSearch() {
        // Create request based on filters
        // Send api call
        // Notify
    }
}
