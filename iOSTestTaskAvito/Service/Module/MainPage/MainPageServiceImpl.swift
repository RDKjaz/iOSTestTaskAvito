//
//  MainPageServiceImpl.swift
//  iOSTestTaskAvito
//
//  Created by Radik Gazetdinov on 29.08.2023.
//

final class MainPageServiceImpl: MainPageService {
    // MARK: - Properties
    private let networkService: NetworkService

    // MARK: - Dependencies
    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    // MARK: - MainPageService
    func advertisements() async -> Result<AdvertisementsResponse, NetworkError> {
        await networkService.send(request: AdvertisementsRequest())
    }
}
