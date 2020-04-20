//
//  MovieDBService.swift
//  PopCorn
//
//  Created by Evgeny on 4/18/20.
//  Copyright © 2020 Evgeny. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper


protocol MovieDBServiceDelegate  : class  {
    func didFinishGettingNowPlaying ( results : [MovieModel]?)
}

class MovieDBService {
    
    weak var delegate : MovieDBServiceDelegate?
    
    let nowPlayingURL = "https://api.themoviedb.org/3/movie/now_playing?api_key="
    let apiKey = "1e1c266b3ca81dad5aea7386cd74c596"
    static let imagePathBase = "https://image.tmdb.org/t/p/w500/"
    
    /// Gets movies that are playing now
    func getNowPlaying(){
        
        AF.request(nowPlayingURL+apiKey).responseJSON { (response) in
            
            switch response.result {
            case let .success(value):
                
                let json = value as! [String :Any]
                let jsonResult   = json["results"] as! [[String: Any]]
                
                let results =  Mapper<MovieModel>().mapArray(JSONArray: jsonResult)
                
                if let delegate = self.delegate {
                    delegate.didFinishGettingNowPlaying(results: results)
                }
                
            case let .failure(error):
                print("Falied to receive data from server with error:\(error)")
            }
        }
        
    }
}
