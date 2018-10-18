//
//  Enviroment.swift
//  MovieDBTest
//
//  Created by Sergio Giraldo on 9/29/18.
//  Copyright © 2018 Sergio Giraldo. All rights reserved.
//

import Foundation

public struct Environment {

    public var name: DeploymentEnvironment
    public var host: String
    public var headers: [String: Any] = [:]
    public var cachePolicy: URLRequest.CachePolicy = .reloadIgnoringLocalAndRemoteCacheData

    public init(_ name: DeploymentEnvironment, host: String) {
        self.name = name
        self.host = host
    }
}

public enum DeploymentEnvironment {
    case development
    case testing
    case production
}
