//
//  LoaderDisplayable.swift
//  iOSTestTaskAvito
//
//  Created by Radik Gazetdinov on 29.08.2023.
//

@MainActor protocol LoaderDisplayable: AnyObject {
    func displayLoader()
    func hideLoader()
}

final class WeakDelayLoaderDisplayable: LoaderDisplayable {
    // MARK: - Properties
    private weak var loaderDisplayable: LoaderDisplayable?

    // MARK: - Init
    init(loaderDisplayable: LoaderDisplayable) {
        self.loaderDisplayable = loaderDisplayable
    }

    // MARK: - LoaderDisplayable
    func displayLoader() {
        loaderDisplayable?.displayLoader()
    }

    func hideLoader() {
        loaderDisplayable?.hideLoader()
    }
}
