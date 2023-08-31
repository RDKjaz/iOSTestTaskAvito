//
//  UIStackView+Extensions.swift
//  iOSTestTaskAvito
//
//  Created by Radik Gazetdinov on 30.08.2023.
//

import UIKit

extension UIStackView {
    func addArrangedSubview(_ view: UIView, useAutoLayout: Bool) {
        view.translatesAutoresizingMaskIntoConstraints = !useAutoLayout
        addArrangedSubview(view)
    }
}
