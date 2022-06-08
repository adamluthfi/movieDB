//
//  ApiManager.swift
//  Movie
//
//  Created by iOS on 11/08/21.
//

import Foundation

import RxAlamofire
import RxSwift

enum ErrorHandler: Error {
    case invalidLink
    case failedParsing
    case unknownError
}

class ApiManager {
    
    func requestAPI<T: Decodable>(endpoint: Endpoint) -> Observable<T> {
        
        var urlRequest = URLRequest(url: URL(string: endpoint.urlString())!)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(Constants.headers)", forHTTPHeaderField: "Authorization")
        
        
        Logger.log("OM-HEADERS: \(String(describing: urlRequest.allHTTPHeaderFields))", logType: .kNetworkRequest)
        Logger.log("OM-URL: \(endpoint.method().rawValue) => \(endpoint.urlString())", logType: .kNetworkRequest)
        Logger.log("OM-PARAMS: \(endpoint.parameters())", logType: .kNetworkRequest)
        
        return Observable.create { observer in
            request(endpoint.method(), endpoint.urlString(), parameters: endpoint.parameters(), headers: nil)
                .flatMap {
                    $0.validate(statusCode: 200...299)
                        .validate(contentType: ["application/json"])
                        .rx.data()
                }
                .observe(on: MainScheduler.instance)
                .decode(type: T.self, decoder: JSONDecoder())
                .subscribe { data in
                    Logger.log(data, logType: .kNetworkResponseSuccess)
                    observer.onNext(data)
                    observer.onCompleted()
                } onError: { error in
                    Logger.log(error, logType: .kNetworkResponseError)
                    print(error.localizedDescription)
                    observer.onError(ErrorHandler.failedParsing)
                }
        }
        
    }
}
