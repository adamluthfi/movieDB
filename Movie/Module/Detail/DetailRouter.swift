// 
//  DetailRouter.swift
//  Movie
//
//  Created by iOS on 11/08/21.
//

import UIKit

class DetailRouter {
    
    func showView(with data: Int) -> DetailView {
        let view = DetailView(nibName: String(describing: DetailView.self), bundle: nil)
        let interactor = DetailInteractor()
        let presenter = DetailPresenter(interactor: interactor, dataPassed: data)
        
        view.presenter = presenter
        return view
    }
    
    //Navigate to other xib-based router
    /*
    func navigateToOtherView(from navigation: UINavigationController, with data: Any) {
        let otherView = OtherViewRouter().showView(with: data)
        navigation.pushViewController(otherView, animated: true)
    }
    */
    
    //Navigate to other storyboard-based router
    /*
    func navigateToOtherView(from navigation: UINavigationController, with data: Any) {
        let otherView = OtherViewRouter().showView(with: data)
        navigation.pushViewController(otherView, animated: true)
    }
     */
    
}
