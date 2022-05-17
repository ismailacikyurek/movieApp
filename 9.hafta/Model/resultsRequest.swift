//
//  MovieCevap.swift
//  9.hafta
//
//  Created by İSMAİL AÇIKYÜREK on 16.05.2022.
//

import Foundation

struct BaseTheMovie : Decodable {
    let totalPages : Int
    let totalResults : Int
    let page : Int
    let results : [Movie]?
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
        case page = "page"
        case totalResults = "total_pages"
        case totalPages = "total_results"
    }
}
