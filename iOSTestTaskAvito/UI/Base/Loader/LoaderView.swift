//
//  LoaderView.swift
//  iOSTestTaskAvito
//
//  Created by Radik Gazetdinov on 29.08.2023.
//

import UIKit

final class LoaderView: UIView {
    // MARK: - Subviews
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        return activityIndicator
    }()

    // MARK: - Init
    init() {
        super.init(frame: .zero)
        addSubview(activityIndicator, useAutoLayout: true)
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods
    func start() {
        activityIndicator.startAnimating()
    }

    func stop() {
        activityIndicator.stopAnimating()
    }

    // MARK: - Constraints
    private func setConstraints() {
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
