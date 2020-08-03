//
//  MovieModel.swift
//  PopCorn
//
//  Created by Evgeny on 4/18/20.
//  Copyright © 2020 Evgeny. All rights reserved.
//

import Foundation
import ObjectMapper


/*
 {
   "popularity": 213.873,
   "id": 454626,
   "video": false,
   "vote_count": 2818,
   "vote_average": 7.6,
   "title": "Sonic the Hedgehog",
   "release_date": "2020-02-12",
   "original_language": "en",
   "original_title": "Sonic the Hedgehog",
   "genre_ids": [
     28,
     878,
     35,
     10751
   ],
   "backdrop_path": "/stmYfCUGd8Iy6kAMBr6AmWqx8Bq.jpg",
   "adult": false,
   "overview": "Based on the global blockbuster videogame franchise from Sega, Sonic the Hedgehog tells the story of the world’s speediest hedgehog as he embraces his new home on Earth. In this live-action adventure comedy, Sonic and his new best friend team up to defend the planet from the evil genius Dr. Robotnik and his plans for world domination.",
   "poster_path": "/aQvJ5WPzZgYVDrxLX4R6cLJCEaQ.jpg"
 }
 */

struct MovieModel : Mappable {
    
    var title : String?
    var overview : String?
    var posterPath : String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        title       <- map["title"]
        overview    <- map["overview"]
        posterPath  <- map["poster_path"]
    }
}

