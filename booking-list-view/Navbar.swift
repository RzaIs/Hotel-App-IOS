//
//  Navbar.swift
//  booking-list-view
//
//  Created by Rza Ismayilov on 20.04.22.
//

import UIKit
import SnapKit

class Navbar : UIStackView {
    
    private lazy var homeBtn : NavbarButton = {
        let imageView : UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(systemName: "house.fill")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
            self.addArrangedSubview(imageView)
            return imageView
        }()
        
        let label : UILabel = {
            let label = UILabel()
            label.text = "Home"
            label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
            label.textColor = .systemGreen
            self.addSubview(label)
            return label
        }()
        
        return NavbarButton(imageView: imageView, label: label)
    }()
    
    private lazy var searchBtn : NavbarButton = {
        let imageView : UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(systemName: "magnifyingglass")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
            self.addArrangedSubview(imageView)
            return imageView
        }()
        
        let label : UILabel = {
            let label = UILabel()
            label.text = "Search"
            label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
            label.textColor = .systemGray
            self.addSubview(label)
            return label
        }()
        
        return NavbarButton(imageView: imageView, label: label)
    }()
    
    private lazy var bookingBtn : NavbarButton = {
        let imageView : UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(systemName: "doc.plaintext")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
            self.addArrangedSubview(imageView)
            return imageView
        }()
        
        let label : UILabel = {
            let label = UILabel()
            label.text = "Booking"
            label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
            label.textColor = .systemGray
            self.addSubview(label)
            return label
        }()
        
        return NavbarButton(imageView: imageView, label: label)
    }()
    
    private lazy var profileBtn : NavbarButton = {
        let imageView : UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(systemName: "person")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
            self.addArrangedSubview(imageView)
            return imageView
        }()
        
        let label : UILabel = {
            let label = UILabel()
            label.text = "Profile"
            label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
            label.textColor = .systemGray
            self.addSubview(label)
            return label
        }()
        
        return NavbarButton(imageView: imageView, label: label)
    }()
    
    private func setupView() {
        
        self.layoutMargins = UIEdgeInsets(top: 16, left: 48, bottom: 32, right: 48)
        self.isLayoutMarginsRelativeArrangement = true
        
        self.axis = .horizontal
        self.alignment = .center
        self.distribution = .equalCentering

        
        
        self.homeBtn.label.snp.makeConstraints { make in
            make.centerX.equalTo(homeBtn.imageView)
            make.top.equalTo(homeBtn.imageView.snp.bottom).offset(8)
        }
        
        self.searchBtn.label.snp.makeConstraints { make in
            make.centerX.equalTo(searchBtn.imageView)
            make.top.equalTo(searchBtn.imageView.snp.bottom).offset(8)
        }
        
        self.bookingBtn.label.snp.makeConstraints { make in
            make.centerX.equalTo(bookingBtn.imageView)
            make.top.equalTo(bookingBtn.imageView.snp.bottom).offset(8)
        }
        
        self.profileBtn.label.snp.makeConstraints { make in
            make.centerX.equalTo(profileBtn.imageView)
            make.top.equalTo(profileBtn.imageView.snp.bottom).offset(8)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
}

struct NavbarButton {
    var imageView : UIImageView
    var label : UILabel
    
    init(imageView : UIImageView, label : UILabel) {
        self.imageView = imageView
        self.label = label
    }
}
