//
//  UpcomingViewModel.swift
//  MovieDBTest
//
//  Created by Sergio Giraldo on 10/9/18.
//  Copyright © 2018 Sergio Giraldo. All rights reserved.
//

import Foundation

class UpcomingViewModel: MovieViewModel {

    init() {
        super.init(movieType: .upcoming)
    }

    override func numberOfItems() -> Int {
        return self.movies!.count
    }

    override func getTitle(for indexPath: IndexPath) -> String {
        return self.movies![indexPath.row].title
    }

    override func getOverview(for indexPath: IndexPath) -> String {
        return self.movies![indexPath.row].overview
    }

    override func getPopularityt(for indexPath: IndexPath) -> Double {
        return self.movies![indexPath.row].popularity
    }

    override func getImagePath(for indexPath: IndexPath) -> String {
        return self.movies![indexPath.row].posterPath ?? "Empty"
    }

    override func getReleaseDate(for indexPath: IndexPath) -> String {
        return self.movies![indexPath.row].releaseDate
    }

    override func getOriginalTitle(for indexPath: IndexPath) -> String {
        return self.movies![indexPath.row].originalTitle
    }

    override func getId(for indexPath: IndexPath) -> Int {
        return self.movies![indexPath.row].id
    }

}
