//
//  ViewController.swift
//  PopCorn
//
//  Created by Evgeny on 4/16/20.
//  Copyright © 2020 Evgeny. All rights reserved.
//


/*
 
 1.create MainView in storyboard
    set constraints
    add label and image view to each cell
 2.connect UI elements in the VC
 3.check sample Response from network
 4.create a model class 'Movie'
    based on response, create properties
 5.create service call
 6.parse response -> create Movie objects
 7.customize cell. Create custom view class.
    Connect in storyBoard.
    Make round corners.
 (make another view with description)
 (add "add to favorites func")
 (save favorites somewhere)
 
 
 */


import UIKit


class NowPlayingViewController : UIViewController, MovieDBServiceDelegate {
    
    @IBOutlet weak var nowPlayingCollectionView: UICollectionView!
    
    let networkService = MovieDBService()
    var movies = [MovieModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.networkService.delegate = self
        self.nowPlayingCollectionView.delegate = self
        self.nowPlayingCollectionView.dataSource = self
                    
        self.networkService.getNowPlaying()
    }

    // MARK: MovieDBServiceDelegate methods:
    func didFinishGettingNowPlaying (results : [MovieModel]?) {
        if let results = results {
            self.movies = results
            self.nowPlayingCollectionView.reloadData()
        }
    }
}


// MARK: - Collection view data source and delegate

extension NowPlayingViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        _ = self.view
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell" , for: indexPath) as! CollectionViewCell
        
        cell.configureCell(with: self.movies[indexPath.row])
        return cell 
    }
}

