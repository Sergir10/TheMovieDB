//
//  VideoViewModel.swift
//  MovieDBTest
//
//  Created by Sergio Giraldo on 10/13/18.
//  Copyright © 2018 Sergio Giraldo. All rights reserved.
//

import Foundation

class VideoViewModel {
    private let movieTask: MovieTask = MovieTask()
    public var delegate: UpdateMoviesDelegate?

    var video: Video?

    private var dispatcher: NetworkDispatcher? {
        let environment: Environment = Environment(.development, host: NetworkConstant.API.host.rawValue)
        return NetworkDispatcher(environment: environment)
    }

    init(from movie: Movie) {
        self.getVideo(by: movie.id)
    }

    func getVideo(by id: Int) {
        movieTask.request = VideoRequest(movieID: id)
        movieTask.getVideoByID(in: dispatcher!) { (video) in
            self.video = video
            self.delegate?.updateMovies()
        }
    }

    func getVideoKey() -> String {
        return (self.video?.key)!
    }

    func getVideoName() -> String {
        return (self.video?.name)!
    }
}
