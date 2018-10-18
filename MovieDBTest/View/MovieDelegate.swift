//
//  MovieDelegate.swift
//  MovieDBTest
//
//  Created by Sergio Giraldo on 10/16/18.
//  Copyright © 2018 Sergio Giraldo. All rights reserved.
//

import Foundation

protocol DetailViewDelegate: class {
    func goToDetailView(_ movie: Movie)
}

protocol UpdateMoviesDelegate {
    func updateMovies()
}
