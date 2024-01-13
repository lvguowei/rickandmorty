//
//  RMService.swift
//  RickAndMorty
//
//  Created by Guowei Lv on 12.1.2024.
//

import Foundation

final class RMService {
    static let shared = RMService()
    private init() {}
    
    public func execute(_ request: RMRequest, completion: @escaping () -> Void) {
        
    }
}
