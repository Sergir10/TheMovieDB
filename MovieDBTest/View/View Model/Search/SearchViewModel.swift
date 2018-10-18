//
//  SearchViewModel.swift
//  MovieDBTest
//
//  Created by Sergio Giraldo on 10/16/18.
//  Copyright © 2018 Sergio Giraldo. All rights reserved.
//

import Foundation

class SearchViewModel {
    public var inProcess: Bool = false
    public var delegate: UpdateMoviesDelegate?

    private let movieTask: MovieTask = MovieTask()
    private var movies: [Movie] = []
    private var dispatcher: NetworkDispatcher? {
        let environment: Environment = Environment(.development, host: NetworkConstant.API.host.rawValue)
        return NetworkDispatcher(environment: environment)
    }

    public func findMoviesByName(by name: String) {
        if !inProcess {
            self.inProcess = true
            movieTask.request = SearchRequest(movieName: name)
            movieTask.findMovieByName(in: dispatcher!) { (movies) in
                self.movies = movies
                self.inProcess = !self.inProcess
                self.delegate?.updateMovies()
            }
        }
    }

    public func getMovie(at index: Int) -> Movie {
        return self.movies[index]
    }
}

extension SearchViewModel: MovieViewModelProtocol {
    func numberOfItems() -> Int {
        return self.movies.count
    }

    func hasVideo(for indexPath: IndexPath) -> Bool {
        return self.movies[indexPath.row].video
    }

    func getTitle(for indexPath: IndexPath) -> String {
        return self.movies[indexPath.row].title
    }

    func getGenreIDs(for indexPath: IndexPath) -> [Int] {
        return self.movies[indexPath.row].genreIDs
    }

    func getOverview(for indexPath: IndexPath) -> String {
        return self.movies[indexPath.row].overview
    }

    func getImagePath(for indexPath: IndexPath) -> String {
        return self.movies[indexPath.row].posterPath ?? ""
    }

    func getReleaseDate(for indexPath: IndexPath) -> String {
        return self.movies[indexPath.row].releaseDate
    }

    func getPopularityt(for indexPath: IndexPath) -> Double {
        return self.movies[indexPath.row].popularity
    }

    func getOriginalTitle(for indexPath: IndexPath) -> String {
        return self.movies[indexPath.row].originalTitle
    }

    func getId(for indexPath: IndexPath) -> Int {
        return self.movies[indexPath.row].id
    }

}
