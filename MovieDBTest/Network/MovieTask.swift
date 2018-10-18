//
//  MovieOperation.swift
//  MovieDBTest
//
//  Created by Sergio Giraldo on 9/29/18.
//  Copyright © 2018 Sergio Giraldo. All rights reserved.
//

import Foundation

class MovieTask: Operation {

    var request: Request?

    init() {}

    func execute(in dispatcher: Dispatcher, completion: @escaping (Any?) -> ()) {
        do {
            guard let req = request else { return }
            try dispatcher.execute(request: req) { (response) in
                completion(response)
            }
        } catch(let error) {
            print(error)
        }
    }

}

extension MovieTask {
    func getMovies(in dispatcher: Dispatcher, completion: @escaping (([Movie]) -> ())) {
        var movies: [Movie] = []
        self.execute(in: dispatcher) { (resp) in
            switch resp as! Response {
            case .json(let jsonData):
                let apiResponse = try! JSONDecoder().decode(MovieApiResponse.self, from: jsonData as! Data)
                movies = apiResponse.movies
                completion(movies)
            default:
                print("There's no data.")
            }
        }
    }

    func getVideoByID(in dispatcher: Dispatcher, completion: @escaping ( (Video) -> ())) {
        var video: [Video]?
        self.execute(in: dispatcher) { (resp) in
            switch resp as! Response {
            case .json(let jsonData):
                let apiResponse = try! JSONDecoder().decode(VideoAPIResponse.self, from: jsonData as! Data)
                video = apiResponse.results
                if let vd = video { completion(vd.first!) }
            default:
                print("There is no data: \(resp.debugDescription)")
            }
        }
    }

    func findMovieByName(in dispatcher: Dispatcher, completion: @escaping ([Movie]) -> ()) {
        var movies: [Movie]?
        self.execute(in: dispatcher) { (resp) in
            switch resp as! Response {
            case .json(let jsonData):
                let apiResponse = try! JSONDecoder().decode(MovieApiResponse.self, from: jsonData as! Data)
                movies = apiResponse.movies
                if let mvs = movies { completion(mvs) }
            default:
                print("There is no data: \(resp.debugDescription)")
            }
        }
    }
}
