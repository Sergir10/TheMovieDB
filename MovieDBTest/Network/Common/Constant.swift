//
//  Constant.swift
//  MovieDBTest
//
//  Created by Sergio Giraldo on 9/29/18.
//  Copyright © 2018 Sergio Giraldo. All rights reserved.
//

import Foundation

public struct NetworkConstant {

    public enum API: String {
        case host = "https://api.themoviedb.org/3/"
        case apiKey = "5fa6aee8ed5a5fb391c745142cdee9ff"
        case imageBaseURL = "https://image.tmdb.org/t/p/original"
        case youtubeHost = "https://www.youtube.com/embed/"
    }

    public enum PATHS: String {
        case popular = "movie/popular"
        case topRated = "movie/top_rated"
        case upcoming = "movie/upcoming"
        case video = "movie/"
        case search = "search/movie"
    }

    public enum NetworkError: Error {
        case badInput
        case noData
    }
}
