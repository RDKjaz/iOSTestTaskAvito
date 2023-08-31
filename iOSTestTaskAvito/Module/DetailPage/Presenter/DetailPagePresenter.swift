//
//  DetailPagePresenter.swift
//  iOSTestTaskAvito
//
//  Created by Radik Gazetdinov on 29.08.2023.
//

import Foundation

final class DetailPagePresenter {
    // MARK: - Weak properties
    weak var view: DetailPageViewProtocol?

    // MARK: - Data
    var advertisementId: String

    // MARK: - Dependencies
    private let router: Router
    private let service: DetailPageService
    private let loaderDisplayable: LoaderDisplayable
    private let errorMessageDisplayable: ErrorMessageDisplayable

    // MARK: - Init
    init(
        view: DetailPageViewProtocol,
        advertisementId: String,
        router: Router,
        service: DetailPageService,
        loaderDisplayable: LoaderDisplayable,
        errorMessageDisplayable: ErrorMessageDisplayable
    ) {
        self.view = view
        self.advertisementId = advertisementId
        self.router = router
        self.service = service
        self.loaderDisplayable = loaderDisplayable
        self.errorMessageDisplayable = errorMessageDisplayable

        loadAdvertisementBy(advertisementId)
    }

    // MARK: - Load advertisement by id
    private func loadAdvertisementBy(_ advertisementId: String) {
        Task {
            await loadAdvertisementBy(advertisementId)
        }
    }

    private func loadAdvertisementBy(_ advertisementId: String) async {
        await loaderDisplayable.displayLoader()
        let result = await service.advertisement(by: advertisementId)
        await loaderDisplayable.hideLoader()

        switch result {
        case let .success(response):
            await handleSuccessGetAdvertisement(with: response)
        case let .failure(error):
            await handleFailureGetAdvertisement(with: error, advertisementId: advertisementId)
        }
    }

    // MARK: - Handlers
    private func handleSuccessGetAdvertisement(with response: AdvertisementByIdResponse) async {
        await view?.display(model:
            SinglePageViewModel(data:
                DetailPageViewData(
                    id: response.id,
                    title: response.title,
                    price: response.price,
                    location: "\(response.location), \(response.address)",
                    imageUrl: URL(string: response.imageUrl),
                    createdDate: response.createdDate.convertToDate()?.toString(format: "d MMMM yyyy") ?? "",
                    description: response.description,
                    email: response.email,
                    phoneNumber: response.phoneNumber
                )
            )
        )
    }

    private func handleFailureGetAdvertisement(with error: NetworkError, advertisementId: String) async {
        await errorMessageDisplayable.displayError(error: error) { [weak self] in
            self?.loadAdvertisementBy(advertisementId)
        }
    }
}
