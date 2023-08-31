//
//  UIView+Extensions.swift
//  iOSTestTaskAvito
//
//  Created by Radik Gazetdinov on 29.08.2023.
//

import UIKit

extension UIView {
    func addSubview(_ view: UIView, useAutoLayout: Bool) {
        view.translatesAutoresizingMaskIntoConstraints = !useAutoLayout
        addSubview(view)
    }
}
