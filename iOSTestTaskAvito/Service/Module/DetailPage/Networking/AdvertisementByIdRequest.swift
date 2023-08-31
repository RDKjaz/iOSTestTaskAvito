//
//  AdvertisementByIdRequest.swift
//  iOSTestTaskAvito
//
//  Created by Radik Gazetdinov on 29.08.2023.
//

final class AdvertisementByIdRequest: NetworkRequest {
    typealias Response = AdvertisementByIdResponse

    // MARK: - Properties
    let id: String

    // MARK: - Init
    init(id: String) {
        self.id = id
    }

    // MARK: - NetworkRequest
    var path: String {
        "s/interns-ios/details/\(id).json"
    }

    let httpMethod = HttpMethod.GET
}
