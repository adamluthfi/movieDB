//
//  EndPoint.swift
//  Movie
//
//  Created by iOS on 11/08/21.
//

import Foundation

import Alamofire
import RxAlamofire
import RxSwift

enum Endpoint {
    case movieList(Int)
    case movieDetail(Int)

    fileprivate func path() -> String {
        switch  self {
        case .movieList(let page):
            return "/4/list/1?page=\(page)&api_key=\(Constants.ApiKey)"
        case .movieDetail(let id):
            return "/3/movie/\(id)?api_key=\(Constants.ApiKey)&append_to_response=videos"
        }
    }
    
    func method() -> HTTPMethod {
        switch self {
        case .movieList, .movieDetail:
            return .get
        }
    }
    
    func parameters() -> [String: Any] {
        switch  self {
        case .movieList, .movieDetail:
            return [:]
        }
    }
    
    func urlString() -> String {
        return Constants.baseURL + path()
    }
}
