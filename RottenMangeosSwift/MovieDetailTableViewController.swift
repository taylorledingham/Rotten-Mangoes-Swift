//
//  MovieDetailTableViewController.swift
//  RottenMangeosSwift
//
//  Created by Taylor Ledingham on 2014-12-06.
//  Copyright (c) 2014 Taylor Ledingham. All rights reserved.
//

import UIKit

class MovieDetailTableViewController: UITableViewController {
    
    var movie: Movie?
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieReleaseDateLabel: UILabel!
    @IBOutlet weak var movieSynopsisTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.movieTitleLabel.text = movie?.movieTitle
        self.movieReleaseDateLabel.text = movie?.releaseDate
        self.movieSynopsisTextView.text = movie?.movieSynopsis
    }
    
}
