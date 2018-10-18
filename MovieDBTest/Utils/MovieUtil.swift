//
//  MovieUtil.swift
//  MovieDBTest
//
//  Created by Sergio Giraldo on 10/4/18.
//  Copyright © 2018 Sergio Giraldo. All rights reserved.
//

import Foundation

public enum MovieSection: String, CaseIterable{
    case popular = "POPULAR"
    case topRated = "TOP RATED"
    case upcoming = "UPCOMING"
}

public struct StoryBoardConstant {

    public enum NibNames: String {
        case HEADERNIB = "MovieTableViewHeader"
    }

    public enum Controllers: String {
        case MOVIEDETAILVIEW = "MovieDetailViewController"
        case YTPLAYERVIEW = "YTPlayerViewController"
    }
}
