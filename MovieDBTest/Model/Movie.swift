//
//  Movie.swift
//  MovieDBTest
//
//  Created by Sergio Giraldo on 9/27/18.
//  Copyright © 2018 Sergio Giraldo. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    let id: Int
    let video: Bool
    let title: String
    let genreIDs: [Int]
    let overview: String
    let popularity: Double
    let posterPath: String?
    let releaseDate: String
    let originalTitle: String

    private enum CodingKeys: String, CodingKey {
        case id
        case video
        case title
        case overview
        case popularity
        case genreIDs = "genre_ids"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case originalTitle = "original_title"
    }
}

struct MovieApiResponse: Decodable {
    let page: Int
    let numberOfResults: Int
    let numberOfPages: Int
    let movies: [Movie]

    private enum CodingKeys: String, CodingKey {
        case page
        case numberOfResults = "total_results"
        case numberOfPages = "total_pages"
        case movies = "results"
    }
}
