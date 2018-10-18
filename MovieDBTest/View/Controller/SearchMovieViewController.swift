//
//  SearchMovieViewController.swift
//  MovieDBTest
//
//  Created by Sergio Giraldo on 10/16/18.
//  Copyright © 2018 Sergio Giraldo. All rights reserved.
//

import UIKit
import SDWebImage

class SearchMovieViewController: UIViewController, UpdateMoviesDelegate {

    @IBOutlet weak var moviesCollectionView: UICollectionView!
    @IBOutlet weak var searchingActivityIndicator: UIActivityIndicatorView!
    
    let searchViewModel = SearchViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        searchViewModel.delegate = self
    }

    func updateMovies() {
        DispatchQueue.main.async {
            self.moviesCollectionView.reloadData()
        }
    }
}

extension SearchMovieViewController: UISearchBarDelegate {

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.text = ""
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchingActivityIndicator.isHidden = false
        searchingActivityIndicator.startAnimating()
        searchBar.resignFirstResponder()
        if !(searchBar.text?.isEmpty)! {
            searchViewModel.findMoviesByName(by: searchBar.text!)
            searchBar.text = ""
        }
    }
}

extension SearchMovieViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchViewModel.numberOfItems()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        self.searchingActivityIndicator.stopAnimating()
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MovieCollectionViewCell

        let imageURL = URL(string: NetworkConstant.API.imageBaseURL.rawValue + (searchViewModel.getImagePath(for: indexPath)))
        print(cell.movieImgView)
        cell.movieImgView.sd_setImage(with: imageURL!, completed: nil)

        return cell
    }
}

extension SearchMovieViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: StoryBoardConstant.Controllers.MOVIEDETAILVIEW.rawValue) as! MovieDetailViewController

        detailVC.movie = searchViewModel.getMovie(at: indexPath.row)
        self.present(detailVC, animated: true, completion: nil)
    }
}
