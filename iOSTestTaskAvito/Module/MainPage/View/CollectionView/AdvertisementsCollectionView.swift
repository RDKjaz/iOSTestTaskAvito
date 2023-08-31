//
//  AdvertisementsCollectionView.swift
//  iOSTestTaskAvito
//
//  Created by Radik Gazetdinov on 29.08.2023.
//

import UIKit

final class AdvertisementsCollectionView: UIView {
    // MARK: - Callbacks
    var onTopRefresh: (() -> Void)?
    var onTapCell: ((_ id: String) -> Void)?

    // MARK: - Data
    private var models: [CollectionViewModel] = []
    private var registerIds: Set<String> = []

    // MARK: - Subviews
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()

    private let refreshControl = UIRefreshControl()

    // MARK: - Init
    init() {
        super.init(frame: .zero)
        addSubview(collectionView, useAutoLayout: true)
        collectionView.addSubview(refreshControl)
        setupContent()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup content
    private func setupContent() {
        collectionView.dataSource = self
        collectionView.delegate = self

        refreshControl.addTarget(self, action: #selector(onTopRefresh(_:)), for: .valueChanged)
    }

    // MARK: - Methods
    func display(models: [CollectionViewModel]) {
        guard self.models != models else { return }

        self.models = models
        collectionView.reloadData()
    }

    func endRefreshing() {
        refreshControl.endRefreshing()
    }

    private func onTapCell(id: String) {
        onTapCell?(id)
    }

    // MARK: - Private methods
    @objc private func onTopRefresh(_ sender: UIRefreshControl) {
        onTopRefresh?()
    }

    // MARK: - Constraints
    private func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension AdvertisementsCollectionView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard indexPath.row < models.count else { return UICollectionViewCell() }

        let model = models[indexPath.row]

        if !registerIds.contains(model.id) {
            registerIds.insert(model.id)

            collectionView.register(
                model.cellType,
                forCellWithReuseIdentifier: model.id
            )
        }

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: model.id, for: indexPath)

        if let cell = cell as? AdvertisementsCollectionViewCell {
            cell.configure(with: model.data)
        }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30) / 2
        return CGSize(width: width, height: width * 1.7)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = models[indexPath.row]
        onTapCell(id: model.id)
    }
}
