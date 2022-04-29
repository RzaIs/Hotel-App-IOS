//
//  Card.swift
//  booking-list-view
//
//  Created by Rza Ismayilov on 16.04.22.
//

import UIKit
import SnapKit

class Card : UIView {
    private lazy var hotelImage : UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 16
        image.clipsToBounds = true
        self.addSubview(image)
        return image
    }()
    
    private lazy var bookmarkImage : UIImageView = {
        let image = UIImageView()
        self.addSubview(image)
        return image
    }()

    private lazy var hotelNameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        self.addSubview(label)
        return label
    }()
    
    private lazy var priceLabel : UILabel = {
        let label = UILabel()
        label.textColor = .systemGreen
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .right
        self.addSubview(label)
        return label
    }()
    
    private lazy var locationLabel : UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 12)
        self.addSubview(label)
        return label
    }()
    
    private lazy var unitLabel : UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 10)
        self.addSubview(label)
        return label
    }()
    
    private lazy var starImage : UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "star.fill")?.withTintColor(.systemYellow, renderingMode: .alwaysOriginal))
        self.addSubview(image)
        return image
    }()
    
    private lazy var ratingLabel : UILabel = {
        let label = UILabel()
        label.textColor = .systemGreen
        label.font = .systemFont(ofSize: 16, weight: .bold)
        self.addSubview(label)
        return label
    }()
    
    private lazy var nbOfReviewLabel : UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 12, weight: .regular)
        self.addSubview(label)
        return label
    }()
    
    private func getImage(imageName: String) -> UIImage? {
        return UIImage(named: imageName)
    }
    
    private func getBookmarkImage(bookmarked: Bool) -> UIImage? {
        if (bookmarked) {
            return (UIImage(systemName: "bookmark.fill")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal))
        } else {
            return (UIImage(systemName: "bookmark")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal))
        }
    }
    
    public func setupView(hotelName : String, imageName: String, price: Int, location: String, rating: Float, nbOfReview : Int, bookmarked: Bool, unit: String) -> Card {
        
        self.backgroundColor = .white
        self.layer.cornerRadius = 24
        
        hotelNameLabel.text = hotelName
        hotelImage.image = getImage(imageName: imageName)
        priceLabel.text = "$\(price)"
        locationLabel.text = location
        ratingLabel.text = "\(rating)"
        nbOfReviewLabel.text = "(\(nbOfReview) reviews)"
        bookmarkImage.image = getBookmarkImage(bookmarked: bookmarked)
        unitLabel.text = "/ \(unit)"
        
        hotelImage.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
            make.height.width.equalTo(96)
        }
        
        hotelNameLabel.snp.makeConstraints { make in
            make.left.equalTo(hotelImage.snp.right).offset(8)
            make.top.equalTo(hotelImage.snp.top)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.left.equalTo(hotelNameLabel.snp.right).offset(16)
            make.centerY.equalTo(hotelNameLabel.snp.centerY)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.left.equalTo(hotelImage.snp.right).offset(8)
            make.centerY.equalToSuperview()
        }
        
        starImage.snp.makeConstraints { make in
            make.left.equalTo(hotelImage.snp.right).offset(16)
            make.bottom.equalTo(hotelImage.snp.bottom)
            make.width.equalTo(starImage.snp.height)
        }
        
        ratingLabel.snp.makeConstraints { make in
            make.left.equalTo(starImage.snp.right).offset(8)
            make.centerY.equalTo(starImage.snp.centerY)
        }
        
        nbOfReviewLabel.snp.makeConstraints { make in
            make.centerY.equalTo(starImage.snp.centerY)
            make.left.equalTo(ratingLabel.snp.right).offset(8)
            make.right.lessThanOrEqualTo(bookmarkImage.snp.left).offset(-8)
        }
        
        bookmarkImage.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
            make.width.equalTo(bookmarkImage.snp.height)
        }
        
        unitLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.top.equalTo(priceLabel.snp.bottom).offset(8)
        }

        return self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
