//
//  DetailPageView.swift
//  iOSTestTaskAvito
//
//  Created by Radik Gazetdinov on 29.08.2023.
//

import UIKit

final class DetailPageView: UIView {
    // MARK: - Data
    private var model: SinglePageViewModel?

    // MARK: - Subviews
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = true
        return scrollView
    }()
    
    private let contentView = UIView()

    private let imageView: AsyncImageView = {
        let imageView = AsyncImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.textColor = .label
        priceLabel.numberOfLines = 0
        priceLabel.font = .systemFont(ofSize: 28, weight: .bold)
        return priceLabel
    }()

    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .label
        titleLabel.numberOfLines = 0
        titleLabel.font = .systemFont(ofSize: 26, weight: .medium)
        return titleLabel
    }()

    private let emailLabel: UILabel = {
        let emailLabel = UILabel()
        emailLabel.textColor = .label
        emailLabel.numberOfLines = 0
        emailLabel.font = .systemFont(ofSize: 20, weight: .regular)
        return emailLabel
    }()

    private let phoneNumberLabel: UILabel = {
        let phoneNumberLabel = UILabel()
        phoneNumberLabel.textColor = .label
        phoneNumberLabel.numberOfLines = 0
        phoneNumberLabel.font = .systemFont(ofSize: 20, weight: .regular)
        return phoneNumberLabel
    }()
    
    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.textColor = .label
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = .systemFont(ofSize: 18, weight: .medium)
        return descriptionLabel
    }()

    private let createdDateLabel: UILabel = {
        let createdDateLabel = UILabel()
        createdDateLabel.textColor = .label
        createdDateLabel.numberOfLines = 0
        createdDateLabel.font = .systemFont(ofSize: 18, weight: .medium)
        return createdDateLabel
    }()
    
    private let locationInfoView = UIView()

    private let locationLabel: UILabel = {
        let locationLabel = UILabel()
        locationLabel.textColor = .label
        locationLabel.numberOfLines = 3
        locationLabel.font = .systemFont(ofSize: 20, weight: .medium)
        return locationLabel
    }()

    // MARK: - Init
    init() {
        super.init(frame: .zero)
        
        addContent()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods
    func display(model: SinglePageViewModel) {
        self.model = model
        guard let data = model.data as? DetailPageViewData else { return }

        imageView.fetchImage(from: data.imageUrl)
        priceLabel.text = data.price
        titleLabel.text = data.title
        emailLabel.text = data.email
        phoneNumberLabel.text = data.phoneNumber
        descriptionLabel.text = data.description
        createdDateLabel.text = data.createdDate
        locationLabel.text = data.location
    }
    
    // MARK: - Add content
    private func addContent() {
        addSubview(scrollView, useAutoLayout: true)
        scrollView.addSubview(imageView, useAutoLayout: true)
        scrollView.addSubview(contentView, useAutoLayout: true)
        contentView.addSubview(priceLabel, useAutoLayout: true)
        contentView.addSubview(titleLabel, useAutoLayout: true)
        scrollView.addSubview(emailLabel, useAutoLayout: true)
        scrollView.addSubview(phoneNumberLabel, useAutoLayout: true)
        scrollView.addSubview(descriptionLabel, useAutoLayout: true)
        scrollView.addSubview(createdDateLabel, useAutoLayout: true)
        contentView.addSubview(locationInfoView, useAutoLayout: true)
        locationInfoView.addSubview(locationLabel, useAutoLayout: true)
    }

    // MARK: - Constraints
    private func setConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),

            imageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: scrollView.widthAnchor),
            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            
            contentView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10),

            priceLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            titleLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            emailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            emailLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            emailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            phoneNumberLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            phoneNumberLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            phoneNumberLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            createdDateLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            createdDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            createdDateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            locationInfoView.topAnchor.constraint(equalTo: createdDateLabel.bottomAnchor, constant: 5),
            locationInfoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            locationInfoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            locationInfoView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            locationInfoView.heightAnchor.constraint(equalToConstant: 70),

            locationLabel.topAnchor.constraint(equalTo: locationInfoView.topAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: locationInfoView.leadingAnchor),
            locationLabel.trailingAnchor.constraint(equalTo: locationInfoView.trailingAnchor),
        ])
    }
}
