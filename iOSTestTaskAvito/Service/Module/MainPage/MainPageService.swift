//
//  MainPageService.swift
//  iOSTestTaskAvito
//
//  Created by Radik Gazetdinov on 29.08.2023.
//

protocol MainPageService: AnyObject {
    func advertisements() async -> Result<AdvertisementsResponse, NetworkError>
}
