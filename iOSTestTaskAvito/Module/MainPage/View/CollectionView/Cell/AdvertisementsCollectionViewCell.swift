//
//  AdvertisementsCollectionViewCell.swift
//  iOSTestTaskAvito
//
//  Created by Radik Gazetdinov on 29.08.2023.
//

import UIKit

final class AdvertisementsCollectionViewCell: UICollectionViewCell {
    // MARK: - Subviews
    private let imageView: AsyncImageView = {
        let imageView = AsyncImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()

    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .label
        titleLabel.numberOfLines = 2
        titleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        return titleLabel
    }()

    private let priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.textColor = .label
        priceLabel.font = .systemFont(ofSize: 18, weight: .bold)
        return priceLabel
    }()

    private let locationLabel: UILabel = {
        let locationLabel = UILabel()
        locationLabel.textColor = .secondaryLabel
        locationLabel.font = .systemFont(ofSize: 14)
        return locationLabel
    }()

    private let createdDateLabel: UILabel = {
        let createdDateLabel = UILabel()
        createdDateLabel.textColor = .secondaryLabel
        createdDateLabel.font = .systemFont(ofSize: 14)
        return createdDateLabel
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground

        imageView.layer.cornerRadius = 10
        contentView.addSubview(imageView, useAutoLayout: true)
        contentView.addSubview(titleLabel, useAutoLayout: true)
        contentView.addSubview(priceLabel, useAutoLayout: true)
        contentView.addSubview(locationLabel, useAutoLayout: true)
        contentView.addSubview(createdDateLabel, useAutoLayout: true)

        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Constraints
    private func setConstraints() {
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),

            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),

            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),

            locationLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 10),
            locationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            locationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),

            createdDateLabel.heightAnchor.constraint(equalToConstant: 20),
            createdDateLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 3),
            createdDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            createdDateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
        ])
    }
}

// MARK: - CollectionViewCellProtocol
extension AdvertisementsCollectionViewCell: CollectionViewCellProtocol {
    func configure(with data: Any) {
        guard let data = data as? AdvertisementsCellData else { return }

        titleLabel.text = data.title
        priceLabel.text = data.price
        locationLabel.text = data.location
        createdDateLabel.text = data.createdDate
        imageView.fetchImage(from: data.imageUrl)
    }
}
