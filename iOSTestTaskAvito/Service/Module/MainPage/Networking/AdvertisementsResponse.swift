//
//  AdvertisementsResponse.swift
//  iOSTestTaskAvito
//
//  Created by Radik Gazetdinov on 29.08.2023.
//

import Foundation

struct AdvertisementsResponse: Decodable {
    let advertisements: [AdvertisementsItemResponse]
}

struct AdvertisementsItemResponse: Decodable {
    let id: String
    let title: String
    let price: String
    let location: String
    let imageUrl: String
    let createdDate: String
}
