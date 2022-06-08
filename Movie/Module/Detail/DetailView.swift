// 
//  DetailView.swift
//  Movie
//
//  Created by iOS on 11/08/21.
//

import UIKit
import RxSwift

class DetailView: UIViewController {
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var langLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var traillerLabel: UIButton!
    
    var presenter: DetailPresenter?
    private let bag = DisposeBag()
    private var urlImage: String?
    private var key: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }

}

extension DetailView {
    
    func setup() {
        loadData()
        configure(detailImage)
        configure(traillerLabel)
    }
    
    func loadData() {
        presenter?.movieId.subscribe(onNext: { movieId in
            self.presenter?.movieDetail(with: movieId).asObserver().subscribe(onNext: {[unowned self] movie in
                self.titleLabel.text = "Name    : \(movie.originalTitle)"
                self.genreLabel.text = "Genre   : \(movie.genres.first?.name ?? "")"
                self.langLabel.text = "Lang     : \(movie.originalLanguage)"
                self.dateLabel.text = "Release  : \(movie.releaseDate)"
                self.runtimeLabel.text = "Time  : \(movie.runtime)m"
                self.overviewLabel.text = movie.overview
                self.detailImage.kf.setImage(with: URL(string: Constants.imageUrl + movie.posterPath))
                self.key = movie.videos.results.first?.key
            }).disposed(by: self.bag)
        }).disposed(by: bag)
    }
    
    func configure(_ image: UIImageView) {
        image.layer.cornerRadius = 10
    }
    
    func configure(_ button: UIButton) {
        button.layer.cornerRadius = 8
        button.rx.tap.subscribe { _ in
            guard let url = URL(string: "https://www.youtube.com/watch?v=\(self.key ?? "")") else { return }
            UIApplication.shared.open(url)
        }.disposed(by: bag)
    }
}

