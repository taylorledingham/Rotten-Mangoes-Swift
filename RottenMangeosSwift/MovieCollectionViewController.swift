//
//  MovieCollectionViewController.swift
//  RottenMangeosSwift
//
//  Created by Taylor Ledingham on 2014-12-01.
//  Copyright (c) 2014 Taylor Ledingham. All rights reserved.
//

import UIKit
import Alamofire
import Foundation

let reuseIdentifier = "Cell"

class MovieCollectionViewController: UICollectionViewController {
    
    var movieArray = Array<Movie>()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadMovieArray()
        }
    
    func loadMovieArray (){
        
        Alamofire.request(.GET, "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?page_limit=50&page=1&country=ca&apikey=dk9s9j76292h6jk44dh5ru92")
            .responseJSON { (_, _, response, _) in
                //println(response)
                let json = JSON(response!)
                let movies = json["movies"]
                for (index: String, subJson: JSON) in movies {
                    var newMovie = Movie()
                    newMovie.movieTitle = subJson["title"].stringValue
                    newMovie.movieSynopsis = subJson["synopsis"].stringValue;
                    newMovie.movieID = subJson["id"].stringValue;
                    newMovie.releaseDate = subJson["release_dates"]["theater"].stringValue;
                    newMovie.criticRating = subJson["ratings"]["critics_score"].stringValue;
                    newMovie.audienceRating = subJson["ratings"]["audience_score"].stringValue;
                    var urlString = subJson["posters"]["thumbnail"].stringValue
                    newMovie.thumbnailImageURL = NSURL.init(string: urlString)
                    urlString = subJson["posters"]["original"].stringValue
                    urlString = urlString.stringByReplacingOccurrencesOfString("tmb", withString: "org", options: nil, range: nil)
                    newMovie.posterImageURL = NSURL.init(string: urlString);
                    self.movieArray.append(newMovie);
                    
                }
                
                self.collectionView?.reloadData();
                
                }
        
    }
    
//#pragma mark UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView?) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView?, numberOfItemsInSection section: Int) -> Int {
        return movieArray.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell    : MovieCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as MovieCollectionViewCell;
        
        var movie : Movie
        movie = self.movieArray[indexPath.row]
        
        cell.setUpCell(movie );
               
        return cell;

}
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "showMovieDetail"){
            
           // var indexPath : NSArray = self.collectionView?.indexPathsForSelectedItems()
            //            var indexPath : NSIndexPath = selectedPath[0];
    
            let indexPath = self.collectionView?.indexPathForCell(sender as UICollectionViewCell)

            var movie: Movie = self.movieArray[indexPath!.row]
            var detailVC = (segue.destinationViewController as MovieDetailTableViewController);
            detailVC.movie = movie;
           
        }
    }
    

}
