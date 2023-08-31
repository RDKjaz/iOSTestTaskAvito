//
//  RequestCreator.swift
//  iOSTestTaskAvito
//
//  Created by Radik Gazetdinov on 29.08.2023.
//

import Foundation

protocol RequestCreator: AnyObject {
    func create(_ request: any NetworkRequest) throws -> URLRequest
}

final class RequestCreatorImpl: RequestCreator {
    // MARK: - Data
    private let host: String

    // MARK: - Init
    init(host: String = "www.avito.st") {
        self.host = host
    }

    // MARK: - RequestCreator
    func create(_ request: any NetworkRequest) throws -> URLRequest {
        guard let url = URL(string: "https://\(host)/\(request.path)") else {
            throw NetworkError.createUrlRequestError
        }

        var urlRequest = URLRequest(url: url, timeoutInterval: 10)
        urlRequest.httpMethod = request.httpMethod.rawValue

        return urlRequest
    }
}
