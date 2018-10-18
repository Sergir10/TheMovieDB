//
//  MovieViewModelProtocol.swift
//  MovieDBTest
//
//  Created by Sergio Giraldo on 10/8/18.
//  Copyright © 2018 Sergio Giraldo. All rights reserved.
//

import Foundation

protocol MovieViewModelProtocol {

    func numberOfItems() -> Int
    func hasVideo(for indexPath: IndexPath) -> Bool
    func getId(for indexPath: IndexPath) -> Int
    func getTitle(for indexPath: IndexPath) -> String
    func getGenreIDs(for indexPath: IndexPath) -> [Int]
    func getOverview(for indexPath: IndexPath) -> String
    func getImagePath(for indexPath: IndexPath) -> String
    func getReleaseDate(for indexPath: IndexPath) -> String
    func getPopularityt(for indexPath: IndexPath) -> Double
    func getOriginalTitle(for indexPath: IndexPath) -> String
}
