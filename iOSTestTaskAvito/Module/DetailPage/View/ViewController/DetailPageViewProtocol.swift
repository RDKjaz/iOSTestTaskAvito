//
//  DetailPageViewProtocol.swift
//  iOSTestTaskAvito
//
//  Created by Radik Gazetdinov on 29.08.2023.
//

@MainActor protocol DetailPageViewProtocol: AnyObject {
    func display(model: SinglePageViewModel)
}
