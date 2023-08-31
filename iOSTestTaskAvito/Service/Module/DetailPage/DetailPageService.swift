//
//  DetailPageService.swift
//  iOSTestTaskAvito
//
//  Created by Radik Gazetdinov on 29.08.2023.
//

protocol DetailPageService: AnyObject {
    func advertisement(
        by id: String
    ) async -> Result<AdvertisementByIdResponse, NetworkError>
}
