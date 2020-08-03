//
//  CollectionViewCell.swift
//  PopCorn
//
//  Created by Evgeny on 4/19/20.
//  Copyright © 2020 Evgeny. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher


class CollectionViewCell : UICollectionViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super .awakeFromNib()
        
        self.layer.cornerRadius = 10.0
        
    }
    
    func configureCell(with movie: MovieModel) {
        
        posterImageView.kf.indicatorType = .activity
        
        if let posterPath = movie.posterPath {
            let path = MovieDBService.imagePathBase + posterPath
            let url = URL(string: path)
            posterImageView.kf.setImage(with: url)
        }
           
        if let title = movie.title {
            movieTitleLabel.text = title
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
