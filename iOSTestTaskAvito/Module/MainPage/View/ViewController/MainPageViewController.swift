//
//  MainPageViewController.swift
//  iOSTestTaskAvito
//
//  Created by Radik Gazetdinov on 29.08.2023.
//

import UIKit

final class MainPageViewController: UIViewController {
    // MARK: - Properties
    var presenter: MainPagePresenter!

    // MARK: - Subviews
    private let loaderView = LoaderView()
    private let collectionView = AdvertisementsCollectionView()
    private let errorMessageView = ErrorMessageView()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Объявления"
        view.backgroundColor = .systemBackground

        view.addSubview(loaderView, useAutoLayout: true)
        view.addSubview(collectionView, useAutoLayout: true)
        view.addSubview(errorMessageView, useAutoLayout: true)
        setConstraints()
    }

    // MARK: - Constraints
    private func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            loaderView.widthAnchor.constraint(equalTo: view.widthAnchor),
            loaderView.heightAnchor.constraint(equalTo: view.heightAnchor),

            errorMessageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            errorMessageView.heightAnchor.constraint(equalTo: view.heightAnchor),
        ])
    }
}

// MARK: - MainPageViewProtocol
extension MainPageViewController: MainPageViewProtocol {
    var onTapCell: ((_ id: String) -> Void)? {
        get { collectionView.onTapCell }
        set { collectionView.onTapCell = newValue }
    }

    var onTopRefresh: (() -> Void)? {
        get { collectionView.onTopRefresh }
        set { collectionView.onTopRefresh = newValue }
    }

    func display(models: [CollectionViewModel]) {
        collectionView.display(models: models)
    }

    func endRefreshing() {
        collectionView.endRefreshing()
    }
}

// MARK: - LoaderDisplayable
extension MainPageViewController: LoaderDisplayable {
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
extension MainPageViewController: ErrorMessageDisplayable {
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
