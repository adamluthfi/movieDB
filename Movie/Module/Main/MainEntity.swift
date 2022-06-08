// 
//  MainEntity.swift
//  Movie
//
//  Created by iOS on 11/08/21.
//

import Foundation

struct MainEntity: Decodable {
    
    let id: Int
    let name: String
    let page: Int
    let results: [Results]
    let sortBy: String
    let totalPages, totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case page
        case results
        case sortBy = "sort_by"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
}

struct Results: Decodable {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let mediaType: String
    let originalLanguage: String
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case mediaType = "media_type"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
