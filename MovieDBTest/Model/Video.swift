//
//  Video.swift
//  MovieDBTest
//
//  Created by Sergio Giraldo on 10/13/18.
//  Copyright © 2018 Sergio Giraldo. All rights reserved.
//

import Foundation

struct Video: Decodable {
    let id: String
    let key: String
    let name: String
    let site: String
    let size: Int
    let type: String

    private enum CodingKeys: String, CodingKey {
        case id
        case key
        case name
        case site
        case size
        case type
    }
}

struct VideoAPIResponse: Decodable {
    let id: Int
    let results: [Video]

    private enum CodingKeys: String, CodingKey {
        case id
        case results
    }
}
