//
//  NetworkService.swift
//  iOSTestTaskAvito
//
//  Created by Radik Gazetdinov on 28.08.2023.
//

protocol NetworkService {
    func send<Request: NetworkRequest>(
        request: Request
    ) async -> Result<Request.Response, NetworkError>
}
