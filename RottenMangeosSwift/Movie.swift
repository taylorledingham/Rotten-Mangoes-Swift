//
//  Movie.swift
//  RottenMangeosSwift
//
//  Created by Taylor Ledingham on 2014-12-02.
//  Copyright (c) 2014 Taylor Ledingham. All rights reserved.
//

import Foundation
import UIKit

class Movie: NSObject {
    
    var movieTitle: String = ""
    var releaseDate: String = ""
    var movieSynopsis: String = ""
    var movieID: String = ""
    var audienceRating: String = ""
    var criticRating: String = ""
    var thumbnailImageURL: NSURL?
    var posterImageURL: NSURL?

    
  func  initWithMovieTitle(title: String) {
    self.movieTitle = title;
    }
    
}