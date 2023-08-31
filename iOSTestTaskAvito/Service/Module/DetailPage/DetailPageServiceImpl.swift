//
//  DetailPageServiceImpl.swift
//  iOSTestTaskAvito
//
//  Created by Radik Gazetdinov on 29.08.2023.
//

final class DetailPageServiceImpl: DetailPageService {
    // MARK: - Properties
    private let networkService: NetworkService

    // MARK: - Dependencies
    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    // MARK: - MainPageService
    func advertisement(
        by id: String
    ) async -> Result<AdvertisementByIdResponse, NetworkError> {
        await networkService.send(request: AdvertisementByIdRequest(id: id))
    }
}
