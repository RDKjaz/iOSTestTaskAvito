//
//  AssemblyBuilder.swift
//  iOSTestTaskAvito
//
//  Created by Radik Gazetdinov on 29.08.2023.
//

import UIKit

final class AssemblyBuilderImpl: AssemblyBuilder {
    func createMainPageModule(router: Router) -> UIViewController {
        let viewController = MainPageViewController()

        let loaderDisplayable = WeakDelayLoaderDisplayable(
            loaderDisplayable: viewController
        )

        let errorMessageDisplayable = WeakErrorMessageDisplayable(
            errorMessageDisplayable: viewController
        )

        let presenter = MainPagePresenter(
            view: viewController,
            router: router,
            service: MainPageServiceImpl(
                networkService: NetworkServiceImpl()
            ),
            loaderDisplayable: loaderDisplayable,
            errorMessageDisplayable: errorMessageDisplayable)

        viewController.presenter = presenter
        presenter.view = viewController

        return viewController
    }

    func createDetailPageModule(id: String, router: Router) -> UIViewController {
        let viewController = DetailPageViewController()

        let loaderDisplayable = WeakDelayLoaderDisplayable(
            loaderDisplayable: viewController
        )

        let errorMessageDisplayable = WeakErrorMessageDisplayable(
            errorMessageDisplayable: viewController
        )

        let presenter = DetailPagePresenter(
            view: viewController,
            advertisementId: id,
            router: router,
            service: DetailPageServiceImpl(
                networkService: NetworkServiceImpl()
            ),
            loaderDisplayable: loaderDisplayable,
            errorMessageDisplayable: errorMessageDisplayable)

        viewController.presenter = presenter
        presenter.view = viewController

        return viewController
    }
}
