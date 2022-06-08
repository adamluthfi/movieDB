//
//  Constant.swift
//  Movie
//
//  Created by iOS on 11/08/21.
//

import Foundation

struct Constants {
    public static var baseURL: String {
        return "https://api.themoviedb.org"
    }
    
    public static var ApiKey: String {
        return "6eb21ccb06df197294c201c7f82537cc"
    }
    
    public static var headers: String {
        return "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2ZWIyMWNjYjA2ZGYxOTcyOTRjMjAxYzdmODI1MzdjYyIsInN1YiI6IjYxMTM4ZmYzMDMxZGViMDA1ZDE4YTFlMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.iHxDFljKOJfarqJ-TnS2wVkkl4poxyiw3Szfxd8uu9E"
    }
    
    public static var imageUrl: String {
        return "https://image.tmdb.org/t/p/w500"
    }
    
    
}
