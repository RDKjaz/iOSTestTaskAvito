//
//  AssemblyBuilder.swift
//  iOSTestTaskAvito
//
//  Created by Radik Gazetdinov on 30.08.2023.
//

import UIKit

@MainActor protocol AssemblyBuilder {
    func createMainPageModule(router: Router) -> UIViewController
    func createDetailPageModule(id: String, router: Router) -> UIViewController
}
