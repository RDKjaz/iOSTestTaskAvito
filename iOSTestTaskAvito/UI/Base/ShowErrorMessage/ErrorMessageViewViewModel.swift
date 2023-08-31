//
//  ErrorMessageViewViewModel.swift
//  iOSTestTaskAvito
//
//  Created by Radik Gazetdinov on 31.08.2023.
//

struct ErrorMessageViewViewModel {
    let errorMessage: String
    let button: Button
}

struct Button {
    let title: String
    let onTap: () -> Void
}
