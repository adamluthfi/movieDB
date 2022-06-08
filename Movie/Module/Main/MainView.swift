// 
//  MainView.swift
//  Movie
//
//  Created by iOS on 11/08/21.
//

import UIKit
import RxSwift
import RxCocoa

class MainView: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(MainTableViewCell.nib, forCellReuseIdentifier: MainTableViewCell.identifier)
        }
    }
    var presenter: MainPresenter?
    var bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }

}

extension MainView {
    
    func setup() {
        configure(tableView)
    }
    
    func configure(_ tableView: UITableView) {
        presenter?.movieList(with: 1).bind(to: tableView.rx.items(cellIdentifier: MainTableViewCell.identifier, cellType: MainTableViewCell.self)) { _, item, cell in
            cell.results = item
        }.disposed(by: bag)
        
        tableView.rx.modelSelected(Results.self).bind { [weak self] item in
            guard let self = self else { return }
            if let indexPath = self.tableView.indexPathForSelectedRow {
                self.tableView.deselectRow(at: indexPath, animated: true)
            }
            
            MainRouter().navigateToDetailView(from: self, with: item.id)
        }.disposed(by: bag)
    }
}

