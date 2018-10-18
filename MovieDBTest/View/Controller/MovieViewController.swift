//
//  ViewController.swift
//  MovieDBTest
//
//  Created by Sergio Giraldo on 9/27/18.
//  Copyright © 2018 Sergio Giraldo. All rights reserved.
//

import UIKit

private let tableViewCellIdentifier = "CategoryCell"
private let tableViewHeaderIdentifier = "HeaderCell"

class MovieViewController: UIViewController, UpdateMoviesDelegate {

    @IBOutlet weak var movieTableView: UITableView!

    private let popularViewModel = PopularViewModel()
    private let topRatedViewModel = TopRatedViewModel()
    private let upcomingViewModel = UpcomingViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        popularViewModel.delegate = self
        topRatedViewModel.delegate = self
        upcomingViewModel.delegate = self
        loadNibs()
    }

    /// Load the NIBS used in the table view.
    func loadNibs() {
        let headerNib = UINib(nibName: StoryBoardConstant.NibNames.HEADERNIB.rawValue, bundle: nil)
        movieTableView.register(headerNib, forHeaderFooterViewReuseIdentifier: tableViewHeaderIdentifier)
    }

    func updateMovies() {
        DispatchQueue.main.async {
            self.movieTableView.reloadData()
        }
    }
}

extension MovieViewController: DetailViewDelegate {
    func goToDetailView(_ movie: Movie) {
        let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: StoryBoardConstant.Controllers.MOVIEDETAILVIEW.rawValue) as! MovieDetailViewController

        detailVC.movie = movie
        self.present(detailVC, animated: true, completion: nil)
    }
}


// MARK: - UITableViewDataSource
extension MovieViewController: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier, for: indexPath) as! MovieTableViewCell

        cell.delegate = self

        switch indexPath.section {
        case 0:
            cell.setData(viewModel: popularViewModel, in: .popular)
        case 1:
            cell.setData(viewModel: topRatedViewModel, in: .topRated)
        case 2:
            cell.setData(viewModel: upcomingViewModel, in: .upcoming)
        default:
            print("Error: The section doesn't exist.")
        }

        return cell
    }

    public func numberOfSections(in tableView: UITableView) -> Int {
        return MovieSection.allCases.count
    }
}


// MARK: - UITableViewDelegate
extension MovieViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35.0
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: tableViewHeaderIdentifier) as! MovieTableViewHeader

        switch section {
        case 0:
            headerView.categoryLabel.text! = MovieSection.popular.rawValue
        case 1:
            headerView.categoryLabel.text! = MovieSection.topRated.rawValue
        case 2:
            headerView.categoryLabel.text! = MovieSection.upcoming.rawValue
        default:
            headerView.categoryLabel.text! = "Other"
        }
    
        return headerView
    }
}
