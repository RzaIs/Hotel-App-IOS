//
//  HotelList.swift
//  booking-list-view
//
//  Created by Rza Ismayilov on 18.04.22.
//

import UIKit
import SnapKit

class HotelList : UIScrollView {
    
    private let cards : [Card] = [
        Card().setupView(hotelName: "President Hotel", imageName: "img1", price: 35, location: "Paris, France", rating: 4.8, nbOfReview: 4378, bookmarked: true, unit: "night"),
        Card().setupView(hotelName: "Palms Casino", imageName: "img2", price: 29, location: "Amsterdam, Netherlands", rating: 4.9, nbOfReview: 5283, bookmarked: false, unit: "night"),
        Card().setupView(hotelName: "Palazzo Versace", imageName: "img3", price: 36, location: "Rome, Italia", rating: 4.7, nbOfReview: 3277, bookmarked: true, unit: "night"),
        Card().setupView(hotelName: "Bulgari Resort", imageName: "img4", price: 27, location: "Istanbul, Turkiye", rating: 4.8, nbOfReview: 4981, bookmarked: false, unit: "night"),
        Card().setupView(hotelName: "Martinez Cannes", imageName: "img5", price: 32, location: "London, United Kingdom", rating: 4.6, nbOfReview: 3672, bookmarked: false, unit: "night")
    ]
    
    private lazy var stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 16
        self.addSubview(stackView)
        return stackView
    }()
    
    private lazy var middleBar : UIView = {
        let view = UIView()
        
        let leftLabel : UILabel = {
            let label = UILabel()
            label.text = "Recently Booked"
            label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            label.textColor = .black
            return label
        }()
        
        let rightLabel : UILabel = {
            let label = UILabel()
            label.text = "See All"
            label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            label.textColor = .systemGreen
            label.textAlignment = .right
            return label
        }()
        
        view.addSubview(leftLabel)
        view.addSubview(rightLabel)
        
        leftLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
        }
        
        rightLabel.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.left.equalTo(leftLabel.snp.right).offset(16)
            make.centerY.equalToSuperview()
        }
        
//        self.addSubview(view)
        return view
    }()
    
    private func setupView() {
        self.layer.cornerRadius = 28
        self.backgroundColor = .systemGray6
    
        stackView.snp.makeConstraints { make in
            make.top.equalTo(self.contentLayoutGuide.snp.top)
            make.right.equalTo(self.contentLayoutGuide.snp.right).offset(-16)
            make.left.equalTo(self.contentLayoutGuide.snp.left).offset(16)
            make.bottom.equalTo(self.contentLayoutGuide.snp.bottom).offset(-16)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        stackView.addArrangedSubview(PageList())
        
        stackView.addArrangedSubview(middleBar)
        
        for card in cards {
            stackView.addArrangedSubview(card)
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
}
