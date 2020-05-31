//
//  FavoriteCell.swift
//  MyFriends
//
//  Created by oleg on 05.01.2020.
//  Copyright © 2020 tets. All rights reserved.
//

import UIKit
import Alamofire

final class FavoriteCell: UITableViewCell {
    
    // MARK: - Public Properties
    static let cellHeight: CGFloat = 100
    static let cellIdentifier: String = "FavoriteCell"
    
    
    // MARK: - Private Properties
    private var model: ArticleModel?
    
    
    // MARK: - Outlets
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var abstract: UILabel!
    @IBOutlet private weak var articlePreview: UIImageView!
    
    
    // MARK: - Lifecycles
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        articlePreview.layer.masksToBounds = true
        articlePreview.layer.cornerRadius = 3
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        articlePreview.image = UIImage(named: "no_images")
        title.text = nil
        abstract.text = nil
    }
    
}


// MARK: - Extensions
extension FavoriteCell {
    
    func fill(model: ArticlePresentationModel) {
        self.model = model.articleModel
        title.text = model.title
        abstract.text = model.abstract
        
        if let url = model.imageUrl {
            AF.request(url)
                .validate()
                .responseData { (response: AFDataResponse<Data>) in
                    guard let data = response.data else { return }
                    self.articlePreview.image = UIImage(data: data)
            }
        }
    }
    
}

