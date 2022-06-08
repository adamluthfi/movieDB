// 
//  MainInteractor.swift
//  Movie
//
//  Created by iOS on 11/08/21.
//

import Foundation
import RxSwift
import Alamofire

class MainInteractor {
    
    var api = ApiManager()
    var bag = DisposeBag()
    
    var dataSubject = PublishSubject<[Results]>()
    
    func fetchData(page: Int) {
        _ = api.requestAPI(endpoint: .movieList(page))
            .subscribe { [weak self] (data: MainEntity) in
                guard let self = self else { return }
                self.dataSubject.onNext(data.results)
            } onError: { [weak self] error in
                guard let self = self else { return }
                print(error.localizedDescription)
                self.dataSubject.onError(error)
            }.disposed(by: bag)
    }
}
