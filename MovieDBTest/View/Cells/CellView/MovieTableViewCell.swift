//
//  MovieTableViewCell.swift
//  MovieDBTest
//
//  Created by Sergio Giraldo on 10/4/18.
//  Copyright © 2018 Sergio Giraldo. All rights reserved.
//

import UIKit
import SDWebImage

private let collectionViewCellIdentifier = "CollectionCell"

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieCollectionView: UICollectionView!

    private var movieViewModel: MovieViewModel?
    private var movieType: MovieSection?

    weak var delegate: DetailViewDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.movieCollectionView.dataSource = self
        self.movieCollectionView.delegate = self
    }

    func setData(viewModel: MovieViewModel, in section: MovieSection) {
        switch section {
        case .popular:
            movieViewModel = viewModel as! PopularViewModel
        case .topRated:
            movieViewModel = viewModel as! TopRatedViewModel
        case .upcoming:
            movieViewModel = viewModel as! UpcomingViewModel
        }
        movieType = section
        DispatchQueue.main.async {
            self.movieCollectionView.reloadData()
        }
    }
}

// MARK: - UICollectionViewDelegate
extension MovieTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let movie = movieViewModel?.movies![indexPath.row] else { return }
        delegate?.goToDetailView(movie)
    }
}

// MARK: - UICollectionViewDataSource
extension MovieTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieViewModel?.numberOfItems() ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewCellIdentifier, for: indexPath) as! MovieCollectionViewCell

        let imageURL = URL(string: NetworkConstant.API.imageBaseURL.rawValue + (movieViewModel?.getImagePath(for: indexPath))!)
        cell.movieImgView.sd_setImage(with: imageURL, completed: nil)

        return cell
    }
}

