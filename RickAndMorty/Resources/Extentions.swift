//
//  Extentions.swift
//  RickAndMorty
//
//  Created by Guowei Lv on 23.1.2024.
//

import Foundation
import UIKit

extension UIView {
    func addSubViews(_ views: UIView...) {
        views.forEach { view in
            self.addSubview(view)
        }
    }
}
