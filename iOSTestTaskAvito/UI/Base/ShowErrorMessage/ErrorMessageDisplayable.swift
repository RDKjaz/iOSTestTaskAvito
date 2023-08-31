//
//  ErrorMessageDisplayable.swift
//  iOSTestTaskAvito
//
//  Created by Radik Gazetdinov on 31.08.2023.
//

import Foundation

@MainActor protocol ErrorMessageDisplayable: AnyObject {
    func displayError(model: ErrorMessageViewViewModel)
    func hideError()
}

extension ErrorMessageDisplayable {
    func displayError(error: NetworkError, onTap: @escaping () -> Void) {
        var errorMessage = ""
        switch error {
        case .createUrlRequestError:
            errorMessage = "Ошибка создания запроса"
        case .lackOfInternet, .timeout:
            errorMessage = "Отсутствует интернет соединение"
        case .parsingFailure:
            errorMessage = "Ошибка парсинга"
        case .networkError:
            errorMessage = "Неизвестная ошибка"
        }

        displayError(model: ErrorMessageViewViewModel(
            errorMessage: errorMessage,
            button: Button(title: "Повторить",
                           onTap: { [weak self] in
                               self?.hideError()
                               onTap()
                           }))
        )
    }
}

final class WeakErrorMessageDisplayable: ErrorMessageDisplayable {
    // MARK: - Properties
    private weak var errorMessageDisplayable: ErrorMessageDisplayable?

    // MARK: - Init
    init(errorMessageDisplayable: ErrorMessageDisplayable) {
        self.errorMessageDisplayable = errorMessageDisplayable
    }

    // MARK: - ErrorMessageDisplayable
    func displayError(model: ErrorMessageViewViewModel) {
        errorMessageDisplayable?.displayError(model: model)
    }

    func hideError() {
        errorMessageDisplayable?.hideError()
    }
}
