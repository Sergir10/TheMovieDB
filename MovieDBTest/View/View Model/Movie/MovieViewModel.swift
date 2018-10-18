//
//  MovieViewModel.swift
//  MovieDBTest
//
//  Created by Sergio Giraldo on 10/9/18.
//  Copyright © 2018 Sergio Giraldo. All rights reserved.
//

import Foundation

class MovieViewModel: MovieViewModelProtocol {

    public var delegate: UpdateMoviesDelegate?
    private let movieTask: MovieTask = MovieTask()

    var movies: [Movie]? = [] {
        didSet {
            delegate?.updateMovies()
        }
    }

    private var dispatcher: NetworkDispatcher? {
        let environment: Environment = Environment(.development, host: NetworkConstant.API.host.rawValue)
        return NetworkDispatcher(environment: environment)
    }

    init(movieType: MovieSection) {
        switch movieType {
        case .popular:
            self.getPopularMovies()
        case .topRated:
            self.getTopRatedMovies()
        case .upcoming:
            self.getupcomingMovies()
        }
    }

    private func getPopularMovies() {
        movieTask.request = MovieRequest.popular
        movieTask.getMovies(in: dispatcher!) { movies in
            self.movies = movies
        }
    }

    private func getTopRatedMovies() {
        movieTask.request = MovieRequest.topRated
        movieTask.getMovies(in: dispatcher!) { movies in
            self.movies = movies
        }
    }

    private func getupcomingMovies() {
        movieTask.request = MovieRequest.upcoming
        movieTask.getMovies(in: dispatcher!) { movies in
            self.movies = movies
        }
    }

    func numberOfItems() -> Int { return 0 }
    func hasVideo(for indexPath: IndexPath) -> Bool { return false }
    func getTitle(for indexPath: IndexPath) -> String { return "" }
    func getOverview(for indexPath: IndexPath) -> String { return ""}
    func getGenreIDs(for indexPath: IndexPath) -> [Int] { return [] }
    func getImagePath(for indexPath: IndexPath) -> String { return "" }
    func getReleaseDate(for indexPath: IndexPath) -> String { return "" }
    func getOriginalTitle(for indexPath: IndexPath) -> String {return ""}
    func getPopularityt(for indexPath: IndexPath) -> Double { return 0.0 }
    func getId(for indexPath: IndexPath) -> Int { return 0 }
}
