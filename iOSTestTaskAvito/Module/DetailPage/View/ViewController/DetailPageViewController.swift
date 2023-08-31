//
//  DetailPageViewController.swift
//  iOSTestTaskAvito
//
//  Created by Radik Gazetdinov on 29.08.2023.
//

import UIKit

final class DetailPageViewController: UIViewController {
    // MARK: - Properties
    var presenter: DetailPagePresenter!

    // MARK: - Subviews
    private let loaderView = LoaderView()
    private let childView = DetailPageView()
    private let errorMessageView = ErrorMessageView()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        addContent()
        setConstraints()
    }
    
    // MARK: - Add content
    private func addContent() {
        view.addSubview(loaderView, useAutoLayout: true)
        view.addSubview(childView, useAutoLayout: true)
        view.addSubview(errorMessageView, useAutoLayout: true)
    }

    // MARK: - Constraints
    private func setConstraints() {
        NSLayoutConstraint.activate([
            childView.widthAnchor.constraint(equalTo: view.widthAnchor),
            childView.heightAnchor.constraint(equalTo: view.heightAnchor),

            loaderView.widthAnchor.constraint(equalTo: view.widthAnchor),
            loaderView.heightAnchor.constraint(equalTo: view.heightAnchor),

            errorMessageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            errorMessageView.heightAnchor.constraint(equalTo: view.heightAnchor),
        ])
    }
}

// MARK: - DetailPageViewProtocol
extension DetailPageViewController: DetailPageViewProtocol {
    func display(model: SinglePageViewModel) {
        childView.display(model: model)
    }
}

// MARK: - LoaderDisplayable
extension DetailPageViewController: LoaderDisplayable {
    func displayLoader() {
        loaderView.isHidden = false
        loaderView.start()
        view.bringSubviewToFront(loaderView)
    }

    func hideLoader() {
        loaderView.isHidden = true
        loaderView.stop()
        view.sendSubviewToBack(loaderView)
    }
}

// MARK: - ShowErrorMessageDisplayable
extension DetailPageViewController: ErrorMessageDisplayable {
    func displayError(model: ErrorMessageViewViewModel) {
        errorMessageView.update(with: model)
        errorMessageView.isHidden = false
        view.bringSubviewToFront(errorMessageView)
    }

    func hideError() {
        errorMessageView.isHidden = true
        view.sendSubviewToBack(errorMessageView)
    }
}
