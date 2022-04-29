//
//  PageList.swift
//  booking-list-view
//
//  Created by Rza Ismayilov on 21.04.22.
//

import UIKit
import SnapKit

class PageList : UIScrollView {
    
    private lazy var stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 24
        self.addSubview(stackView)
        return stackView
    }()
    
    private func setupView() {
//        self.backgroundColor = .blue
    
        stackView.snp.makeConstraints { make in
            make.right.equalTo(self.contentLayoutGuide.snp.right)
            make.left.equalTo(self.contentLayoutGuide.snp.left)
            make.top.equalTo(self.contentLayoutGuide.snp.top).offset(16)
            make.bottom.equalTo(self.contentLayoutGuide.snp.bottom).offset(-16)
            make.centerY.equalTo(self.snp.centerY)
        }
        
        stackView.addArrangedSubview(Page().setupView(imageName: "bimage1", rating: 4.8, price: 29, unit: "per night", location: "Paris, France", hotelName: "Emerdale De Hotel"))
        stackView.addArrangedSubview(Page().setupView(imageName: "bimage2", rating: 4.6, price: 32, unit: "per night", location: "Istanbul, Turkiye", hotelName: "Hotel name2"))
        stackView.addArrangedSubview(Page().setupView(imageName: "bimage3", rating: 4.7, price: 30, unit: "per night", location: "Rome, Italia", hotelName: "Hotel name3"))
        
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
