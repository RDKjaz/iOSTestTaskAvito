//
//  NetworkServiceImpl.swift
//  iOSTestTaskAvito
//
//  Created by Radik Gazetdinov on 29.08.2023.
//

import Foundation

final class NetworkServiceImpl: NetworkService {
    // MARK: - Properties
    private let urlSession: URLSession = URLSession(configuration: .ephemeral)

    // MARK: - Dependencies
    private let requestCreator: RequestCreator

    // MARK: - Init
    init(requestCreator: RequestCreator = RequestCreatorImpl()) {
        self.requestCreator = requestCreator
    }

    // MARK: - NetworkService
    func send<Request: NetworkRequest>(
        request: Request
    ) async -> Result<Request.Response, NetworkError> {
        guard let urlRequest = try? requestCreator.create(request) else {
            return .failure(.createUrlRequestError)
        }

        do {
            let (data, _) = try await urlSession.data(for: urlRequest)

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            guard let response = try? decoder.decode(Request.Response.self, from: data) else {
                return .failure(.parsingFailure)
            }

            return .success(response)
        } catch {
            switch (error as? URLError)?.code {
            case .some(.notConnectedToInternet):
                return .failure(.lackOfInternet)
            case .some(.timedOut):
                return .failure(.timeout)
            default:
                return .failure(.networkError)
            }
        }
    }
}
