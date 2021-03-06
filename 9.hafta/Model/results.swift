//
//  Movie.swift
//  9.hafta
//
//  Created by İSMAİL AÇIKYÜREK on 16.05.2022.
//

import Foundation
import Alamofire

struct Movie : Decodable {
    
    var adult : Bool
    var backdrop_path : String?
    var genre_ids : [Int]
    var id: Int
    var originalLanguage: String
    var originalTitle: String
    var overview: String
    var popularity: Double
    var posterPath: String?
    var releaseDate: String
    var title: String
    var video : Bool
    var voteAverage: Double
    var voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdrop_path = "backdrop_path"
        case genre_ids = "genre_ids"
        case id = "id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title = "title"
        case video = "video"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
}
