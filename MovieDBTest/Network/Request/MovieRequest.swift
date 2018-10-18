//
//  RequestImplement.swift
//  MovieDBTest
//
//  Created by Sergio Giraldo on 9/29/18.
//  Copyright © 2018 Sergio Giraldo. All rights reserved.
//

import Foundation

public enum MovieRequest: Request, CaseIterable {

    case popular
    case topRated
    case upcoming

    public var path: String {
        switch self {
        case .popular:
            return NetworkConstant.PATHS.popular.rawValue
        case .topRated:
            return NetworkConstant.PATHS.topRated.rawValue
        case .upcoming:
            return NetworkConstant.PATHS.upcoming.rawValue
        }
    }

    public var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }

    public var dataType: DataType {
        return .JSON
    }

    public var params: RequestParams {
        switch self {
        default:
            return .url(["api_key": NetworkConstant.API.apiKey.rawValue])
        }
    }

    public var headers: [String : Any]? {
        switch self {
        default:
            return nil
        }
    }
}
