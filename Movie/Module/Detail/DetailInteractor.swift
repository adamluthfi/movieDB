// 
//  DetailInteractor.swift
//  Movie
//
//  Created by iOS on 11/08/21.
//

import Foundation
import RxSwift
import Alamofire

class DetailInteractor {
    
    var api = ApiManager()
    var bag = DisposeBag()
    
    var dataSubject = PublishSubject<DetailEntity>()
    
    func fetchData(with movieId: Int) {
        _ = api.requestAPI(endpoint: .movieDetail(movieId))
            .subscribe { [weak self] (data: DetailEntity) in
                guard let self = self else { return }
                self.dataSubject.onNext(data)
            } onError: { [weak self] error in
                guard let self = self else { return }
                print(error.localizedDescription)
                self.dataSubject.onError(error)
            }.disposed(by: bag)
    }
}
