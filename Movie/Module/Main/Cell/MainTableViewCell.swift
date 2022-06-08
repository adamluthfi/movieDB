//
//  MainTableViewCell.swift
//  Movie
//
//  Created by iOS on 11/08/21.
//

import UIKit
import Kingfisher

class MainTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: MainTableViewCell.self)
    static let nib = {
        return UINib(
        nibName: identifier,
        bundle: nil)
    }()
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var results: Results? {
        didSet {
            if let name = results?.originalTitle, let overview = results?.overview {
                titleLabel.text = name
                overviewLabel.text = overview
            }
            
            if let imageString = results?.backdropPath {
                posterImage.kf.setImage(with: URL(string: Constants.imageUrl + imageString))
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
