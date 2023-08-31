//
//  MainPagePresenter.swift
//  iOSTestTaskAvito
//
//  Created by Radik Gazetdinov on 29.08.2023.
//

import Foundation

final class MainPagePresenter {
    // MARK: - Weak properties
    @MainActor weak var view: MainPageViewProtocol? {
        didSet {
            setupView()
        }
    }

    // MARK: - Data
    var advertisements = [AdvertisementsItemResponse]()

    // MARK: - Dependencies
    private let router: Router
    private let service: MainPageService
    private let loaderDisplayable: LoaderDisplayable
    private let errorMessageDisplayable: ErrorMessageDisplayable

    // MARK: - Init
    init(
        view: MainPageViewProtocol,
        router: Router,
        service: MainPageService,
        loaderDisplayable: LoaderDisplayable,
        errorMessageDisplayable: ErrorMessageDisplayable
    ) {
        self.view = view
        self.router = router
        self.service = service
        self.loaderDisplayable = loaderDisplayable
        self.errorMessageDisplayable = errorMessageDisplayable

        loadAdvertisements()
    }

    // MARK: - Setup view
    @MainActor private func setupView() {
        view?.onTopRefresh = { [weak self] in
            self?.loadAdvertisements(isRefreshing: true)
        }

        view?.onTapCell = { [weak self] id in
            self?.handleTapCell(id: id)
        }
    }

    // MARK: - Handle tap cell
    @MainActor func handleTapCell(id: String) {
        router.showDetail(id: id)
    }

    // MARK: - Load advertisements
    private func loadAdvertisements(isRefreshing: Bool = false) {
        Task {
            await loadAdvertisements(isRefreshing: isRefreshing)
        }
    }

    private func loadAdvertisements(isRefreshing: Bool = false) async {
        if isRefreshing {
            advertisements.removeAll()
        }

        let loaderDisplayable = isRefreshing ? nil : loaderDisplayable

        await loaderDisplayable?.displayLoader()
        let result = await service.advertisements()
        await loaderDisplayable?.hideLoader()

        await view?.endRefreshing()

        switch result {
        case let .success(response):
            advertisements = response.advertisements
            await handleSuccessGetAdvertisements(with: advertisements)
        case let .failure(error):
            await handleFailureGetAdvertisements(with: error)
        }
    }

    // MARK: - Handle getting advertisements
    private func handleSuccessGetAdvertisements(with response: [AdvertisementsItemResponse]) async {
        await view?.display(models: response
            .enumerated()
            .map {
                CollectionViewModel(
                    id: $1.id,
                    data: AdvertisementsCellData(
                        id: $1.id,
                        title: $1.title,
                        price: $1.price,
                        location: $1.location,
                        imageUrl: URL(string: $1.imageUrl),
                        createdDate: $1.createdDate.convertToDate()?.toString(format: "d MMMM yyyy") ?? ""
                    ),
                    cellType: AdvertisementsCollectionViewCell.self
                )
            }
        )
    }

    private func handleFailureGetAdvertisements(with error: NetworkError) async {
        await errorMessageDisplayable.displayError(error: error) { [weak self] in
            self?.loadAdvertisements()
        }
    }
}
