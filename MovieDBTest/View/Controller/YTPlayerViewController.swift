//
//  YTPlayerViewController.swift
//  MovieDBTest
//
//  Created by Sergio Giraldo on 10/17/18.
//  Copyright © 2018 Sergio Giraldo. All rights reserved.
//

import UIKit
import WebKit

class YTPlayerViewController: UIViewController {

    @IBOutlet weak var YTWebView: WKWebView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var loadActivityIndicator: UIActivityIndicatorView!

    public var videoCode: String?
    public var movieName: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        getVideo()
        self.YTWebView.navigationDelegate = self
        self.movieNameLabel.text = movieName!
    }

    private func getVideo() {
        guard let code = videoCode else { return }
        guard let videoURL = URL(string: NetworkConstant.API.youtubeHost.rawValue + code) else { return }
        self.YTWebView.load(URLRequest(url: videoURL))
    }

    @IBAction func close(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension YTPlayerViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.loadActivityIndicator.stopAnimating()
    }
}
