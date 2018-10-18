//
//  VideoRequest.swift
//  MovieDBTest
//
//  Created by Sergio Giraldo on 10/13/18.
//  Copyright © 2018 Sergio Giraldo. All rights reserved.
//

import Foundation

public struct VideoRequest: Request {
    public var movieID: Int?
    public var path: String = ""
    public var method: HTTPMethod = .get
    public var dataType: DataType = .JSON
    public var headers: [String : Any]? = nil
    public var params: RequestParams = .url(["api_key": NetworkConstant.API.apiKey.rawValue])

    init(movieID: Int) {
        self.path = "\(NetworkConstant.PATHS.video.rawValue)\(movieID)/videos"
    }
}
