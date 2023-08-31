//
//  AdvertisementsRequest.swift
//  iOSTestTaskAvito
//
//  Created by Radik Gazetdinov on 29.08.2023.
//

final class AdvertisementsRequest: NetworkRequest {
    typealias Response = AdvertisementsResponse

    // MARK: - NetworkRequest
    let path = "s/interns-ios/main-page.json"
    let t: Int = 0
    let httpMethod = HttpMethod.GET
}
