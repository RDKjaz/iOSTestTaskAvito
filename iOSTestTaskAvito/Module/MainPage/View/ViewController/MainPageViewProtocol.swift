//
//  MainPageViewProtocol.swift
//  iOSTestTaskAvito
//
//  Created by Radik Gazetdinov on 29.08.2023.
//

@MainActor protocol MainPageViewProtocol: AnyObject {
    var onTopRefresh: (() -> Void)? { get set }
    var onTapCell: ((_ id: String) -> Void)? { get set }
    func display(models: [CollectionViewModel])
    func endRefreshing()
}
