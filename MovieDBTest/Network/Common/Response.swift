//
//  Response.swift
//  MovieDBTest
//
//  Created by Sergio Giraldo on 9/29/18.
//  Copyright © 2018 Sergio Giraldo. All rights reserved.
//

import Foundation

public enum Response {
    case json(_: Any)
    case data(_: Data)
    case error(_: Int?, _: Error?)

    init(_ response: (r: HTTPURLResponse?, data: Data?, error: Error?), for request: Request) {
        guard response.r?.statusCode == 200, response.error == nil else {
            self = .error(response.r?.statusCode, response.error)
            return
        }

        guard let data = response.data else {
            self = .error(response.r?.statusCode, NetworkConstant.NetworkError.noData)
            return
        }

        switch request.dataType {
        case .data:
            self = .data(data)
        case .JSON:
            //let jsonStruct = try! JSONDecoder().decode(MovieApiResponse.self, from: data)
            self = .json(data)
        }
    }
}
