//
//  HttpError.swift
//  iOSTestTaskAvito
//
//  Created by Radik Gazetdinov on 29.08.2023.
//

enum NetworkError: Error {
    case createUrlRequestError
    case lackOfInternet
    case parsingFailure
    case networkError
    case timeout
}
