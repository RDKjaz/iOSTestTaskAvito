//
//  AdvertisementsCellData.swift
//  iOSTestTaskAvito
//
//  Created by Radik Gazetdinov on 29.08.2023.
//

import Foundation

struct AdvertisementsCellData: Hashable {
    let id: String
    let title: String
    let price: String
    let location: String
    let imageUrl: URL?
    let createdDate: String
}
