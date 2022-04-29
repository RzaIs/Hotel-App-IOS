//
//  Page.swift
//  booking-list-view
//
//  Created by Rza Ismayilov on 21.04.22.
//

import UIKit
import SnapKit

class Page : UIView {
    
    private lazy var bgImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 32
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        self.addSubview(imageView)
        return imageView
    }()
    
    private lazy var starImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        ratingView.addSubview(imageView)
        return imageView
    }()
    
    private lazy var ratingLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .white
        ratingView.addSubview(label)
        return label
    }()
    
    private lazy var ratingView : UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        view.layer.cornerRadius = 14
        self.addSubview(view)
        return view
    }()
    
    private lazy var priceLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        
        label.shadowColor = .systemGray
        label.shadowOffset = CGSize(width: -1, height: 1)

        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        self.addSubview(label)
        return label
    }()
    
    private lazy var unitLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        
        label.shadowColor = .systemGray
        label.shadowOffset = CGSize(width: -1, height: 1)

        label.font = .systemFont(ofSize: 12, weight: .regular)
        self.addSubview(label)
        return label
    }()
    
    private lazy var locationLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white

        label.shadowColor = .systemGray
        label.shadowOffset = CGSize(width: -1, height: 1)

        label.font = .systemFont(ofSize: 14, weight: .regular)
        self.addSubview(label)
        return label
    }()
    
    private lazy var hotelNameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        label.shadowColor = .systemGray
        label.shadowOffset = CGSize(width: -1, height: 1)
        
        label.textColor = .white
        self.addSubview(label)
        return label
    }()
    
    private lazy var bookmarkImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bookmark")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        self.addSubview(imageView)
        return imageView
    }()
    
    public func setupView(imageName : String, rating : Float, price : Int, unit : String, location : String, hotelName : String) -> Page {
        
        bgImageView.image = UIImage(named: imageName)
        ratingLabel.text = "\(rating)"
        priceLabel.text = "$\(price)"
        unitLabel.text = "/ \(unit)"
        locationLabel.text = location
        hotelNameLabel.text = hotelName
        
        self.snp.makeConstraints { make in
            make.width.equalTo(220)
            make.height.equalTo(280)
        }
        
        bgImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        ratingView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        starImage.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(8)
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.width.height.equalTo(12)
        }
        
        ratingLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(starImage.snp.right).offset(8)
            make.right.equalToSuperview().offset(-8)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-16)
            make.left.equalToSuperview().offset(16)
        }
        
        unitLabel.snp.makeConstraints { make in
            make.left.equalTo(priceLabel.snp.right).offset(8)
            make.right.lessThanOrEqualTo(bookmarkImage.snp.left).offset(8)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalTo(priceLabel.snp.top).offset(-8)
        }
        
        hotelNameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalTo(locationLabel.snp.top).offset(-8)
        }
        
        bookmarkImage.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
            make.width.height.equalTo(16)
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
