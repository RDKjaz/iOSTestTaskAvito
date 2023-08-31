//
//  NetworkRequest.swift
//  iOSTestTaskAvito
//
//  Created by Radik Gazetdinov on 29.08.2023.
//

import Foundation

protocol NetworkRequest: AnyObject where Response: Decodable {
    associatedtype Response

    var path: String { get }
    var httpMethod: HttpMethod { get }
}
