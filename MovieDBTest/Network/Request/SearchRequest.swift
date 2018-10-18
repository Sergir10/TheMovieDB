//
//  SearchRequest.swift
//  MovieDBTest
//
//  Created by Sergio Giraldo on 10/16/18.
//  Copyright © 2018 Sergio Giraldo. All rights reserved.
//

import Foundation

public struct SearchRequest: Request {

    public var path: String = ""
    public var method: HTTPMethod = .get
    public var dataType: DataType = .JSON
    public var params: RequestParams
    public var headers: [String : Any]? = nil

    init(movieName: String) {
        self.path = NetworkConstant.PATHS.search.rawValue
        self.params = .url(["api_key": NetworkConstant.API.apiKey.rawValue, "query": String(movieName)])
    }

}
