//
//  RequestProtocol.swift
//  MovieDBTest
//
//  Created by Sergio Giraldo on 9/29/18.
//  Copyright © 2018 Sergio Giraldo. All rights reserved.
//

import Foundation

public protocol Request {
    var path: String { get }
    var method: HTTPMethod { get }
    var dataType: DataType { get }
    var params: RequestParams { get }
    var headers: [String: Any]? { get }
}

public enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case patch = "PATCH"
    case delete = "DELETE"
}

public enum DataType {
    case JSON
    case data
}

public enum RequestParams {
    case body(_ : [String: Any]?)
    case url(_ : [String: Any]?)
}
