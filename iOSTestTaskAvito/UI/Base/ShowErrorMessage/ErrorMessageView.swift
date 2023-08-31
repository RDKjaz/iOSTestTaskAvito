//
//  ErrorMessageView.swift
//  iOSTestTaskAvito
//
//  Created by Radik Gazetdinov on 29.08.2023.
//

import UIKit

final class ErrorMessageView: UIView {
    // MARK: - Callbacks
    private var onButtonTap: (() -> Void)?

    // MARK: - Subviews
    private let errorMessageLabel = UILabel()

    private let button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        return button
    }()

    // MARK: - Init
    init() {
        super.init(frame: .zero)
        backgroundColor = .systemBackground
        isHidden = true

        addSubview(errorMessageLabel, useAutoLayout: true)
        addSubview(button, useAutoLayout: true)

        button.addTarget(self, action: #selector(onButtonTap(_:)), for: .touchUpInside)

        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Update
    func update(with model: ErrorMessageViewViewModel) {
        errorMessageLabel.text = model.errorMessage
        button.setTitle(model.button.title, for: .normal)

        onButtonTap = {
            model.button.onTap()
        }
    }

    // MARK: - Constraints
    private func setConstraints() {
        let bounds = UIScreen.main.bounds
        let constantWidthButton = bounds.width / 4 + 50

        NSLayoutConstraint.activate([
            errorMessageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            errorMessageLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

            button.centerXAnchor.constraint(equalTo: centerXAnchor),
            button.topAnchor.constraint(equalTo: errorMessageLabel.bottomAnchor, constant: 10),
            button.heightAnchor.constraint(equalToConstant: 40),
            button.widthAnchor.constraint(equalToConstant: constantWidthButton),
        ])
    }

    // MARK: - Button tap handler
    @objc private func onButtonTap(_ sender: UIButton) {
        onButtonTap?()
    }
}
