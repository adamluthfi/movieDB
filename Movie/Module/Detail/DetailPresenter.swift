// 
//  DetailPresenter.swift
//  Movie
//
//  Created by iOS on 11/08/21.
//

import Foundation
import RxSwift

class DetailPresenter {
    
    private let interactor: DetailInteractor
    private let router = DetailRouter()
    var movieId = AsyncSubject<Int>()
    
    init(interactor: DetailInteractor, dataPassed: Int?) {
        self.interactor = interactor
        if let data = dataPassed {
            movieId.onNext(data)
            movieId.onCompleted()
        }
    }
    
    func movieDetail(with movieId: Int) -> PublishSubject<DetailEntity> {
        interactor.fetchData(with: movieId)
        return interactor.dataSubject
    }
    
}
