//
//  DispatcherImplementation.swift
//  MovieDBTest
//
//  Created by Sergio Giraldo on 9/29/18.
//  Copyright © 2018 Sergio Giraldo. All rights reserved.
//

import Foundation

public class NetworkDispatcher: Dispatcher {

    private var environment: Environment
    private var session: URLSession

    required public init(environment: Environment) {
        self.environment = environment
        self.session = URLSession(configuration: URLSessionConfiguration.default)
    }

    public func execute(request: Request, completion: @escaping (Any?) -> ()) throws {
        let rq = try self.prepare(request: request)
        URLSession.shared.dataTask(with: rq) { (data, response, error) in
            let response = Response((response as? HTTPURLResponse, data, error), for: request)
            completion(response)
            }.resume()
    }

    private func prepare(request: Request) throws -> URLRequest {
        let fullUrl = "\(environment.host)\(request.path)"
        var urlRequest = URLRequest(url: URL(string: fullUrl)!)

        switch request.params {
        case .body(let params):
            if let params = params as? [String : String] {
                let body = try? JSONEncoder().encode(params)
                urlRequest.httpBody = body
            } else {
                throw NetworkConstant.NetworkError.badInput
            }

        case .url(let params):
            if let params = params as? [String : String] {
                let queryParams = params.map { pair  in
                    return URLQueryItem(name: pair.key, value: pair.value)
                }
                guard var components = URLComponents(string: fullUrl) else {
                    throw NetworkConstant.NetworkError.badInput
                }
                components.queryItems = queryParams
                urlRequest.url = components.url
            } else {
                throw NetworkConstant.NetworkError.badInput
            }
        }

        environment.headers.forEach { urlRequest.addValue($0.value as! String, forHTTPHeaderField: $0.key) }
        request.headers?.forEach { urlRequest.addValue($0.value as! String, forHTTPHeaderField: $0.key) }

        urlRequest.httpMethod = request.method.rawValue
        return urlRequest
    }
}
