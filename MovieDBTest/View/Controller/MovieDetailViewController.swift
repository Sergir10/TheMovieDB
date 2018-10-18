//
//  MovieDetailViewController.swift
//  MovieDBTest
//
//  Created by Sergio Giraldo on 10/11/18.
//  Copyright © 2018 Sergio Giraldo. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage



class MovieDetailViewController: UIViewController {

    /// MARK: - Outlets
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieOriginalTitleLabel: UILabel!
    @IBOutlet weak var movieOverviewTextLabel: UITextView!
    @IBOutlet weak var moviePopularityLabel: UILabel!
    @IBOutlet weak var moviePublicLabel: UILabel!
    @IBOutlet weak var movieReleaseDateLabel: UILabel!

    private var movieImgURL: URL?
    private var indexPath = IndexPath(row: 0, section: 0)

    public var movie: Movie? {
        didSet {
            videoViewModel = VideoViewModel(from: movie!)
        }
    }

    public var videoViewModel: VideoViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        settingView()
    }

    func settingView() {
        guard let posterURL = URL(string: NetworkConstant.API.imageBaseURL.rawValue + (self.movie?.posterPath!)!) else { return }

        self.movieImageView.sd_setImage(with: posterURL, completed: nil)
        self.movieTitleLabel.text = movie?.title
        self.movieOriginalTitleLabel.text = movie?.originalTitle
        self.movieOverviewTextLabel.text = movie?.overview
        self.moviePopularityLabel.text = String(movie!.popularity)
        self.moviePublicLabel.text = String(movie!.genreIDs.first!)
        self.movieReleaseDateLabel.text = movie?.releaseDate
    }

    @IBAction func closeMovieDetail(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func playMovieTrailer(_ sender: UIButton) {
        videoViewModel?.delegate = self
        videoViewModel?.getVideo(by: (movie?.id)!)
    }
}

extension MovieDetailViewController: UpdateMoviesDelegate {
    func updateMovies() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyBoard.instantiateViewController(withIdentifier: StoryBoardConstant.Controllers.YTPLAYERVIEW.rawValue) as! YTPlayerViewController

        destinationVC.movieName = self.videoViewModel?.getVideoName()
        destinationVC.videoCode = self.videoViewModel?.getVideoKey()

        DispatchQueue.main.async {
            self.present(destinationVC, animated: true, completion: nil)
        }
    }
}
