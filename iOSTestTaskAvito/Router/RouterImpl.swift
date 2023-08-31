//
//  RouterImpl.swift
//  iOSTestTaskAvito
//
//  Created by Radik Gazetdinov on 30.08.2023.
//

import UIKit

final class RouterImpl: Router {
    // MARK: - Properties
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilder?

    // MARK: - Init
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilder) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }

    // MARK: - Methods
    func initial() {
        if let navigationController = navigationController {
            guard let mainPageViewController = assemblyBuilder?.createMainPageModule(router: self) else { return }
            navigationController.viewControllers = [mainPageViewController]
        }
    }

    func showDetail(id: String) {
        if let navigationController = navigationController {
            guard let detailPageViewController = assemblyBuilder?.createDetailPageModule(id: id, router: self) else { return }
            navigationController.pushViewController(detailPageViewController, animated: true)
        }
    }
}
