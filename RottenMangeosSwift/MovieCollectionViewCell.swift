//
//  MovieCollectionViewCell.swift
//  RottenMangeosSwift
//
//  Created by Taylor Ledingham on 2014-12-05.
//  Copyright (c) 2014 Taylor Ledingham. All rights reserved.
//

import UIKit
import Haneke

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    
    
    func setUpCell( myMovie: Movie){
        
        var err: NSError?
        var url = myMovie.posterImageURL
        self.movieTitleLabel.text = myMovie.movieTitle
        self.movieImageView.hnk_setImageFromURL(url!)

        
}

}

