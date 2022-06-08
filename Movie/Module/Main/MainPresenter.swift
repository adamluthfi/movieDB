// 
//  MainPresenter.swift
//  Movie
//
//  Created by iOS on 11/08/21.
//

import Foundation
import RxSwift
import RxCocoa

class MainPresenter {
    
    private let interactor: MainInteractor
    private let router = MainRouter()
    private let disposeBag = DisposeBag()
    
    init(interactor: MainInteractor) {
        self.interactor = interactor
    }
    
    func movieList(with page: Int) -> PublishSubject<[Results]> {
        interactor.fetchData(page: page)
        return interactor.dataSubject
    }
    
}
