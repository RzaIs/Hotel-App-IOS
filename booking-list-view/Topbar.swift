//
//  TopBar.swift
//  booking-list-view
//
//  Created by Rza Ismayilov on 18.04.22.
//

import UIKit
import SnapKit

class Topbar : UIView {
    
    private lazy var logoImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "h.square.fill")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
        self.addSubview(imageView)
        return imageView
    }()
    
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Helia"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        self.addSubview(label)
        return label
    }()
    
    private lazy var bellImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bell")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
        self.addSubview(imageView)
        return imageView
    }()
    
    private lazy var bookmarkImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bookmark")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
        self.addSubview(imageView)
        return imageView
    }()
    
    private lazy var helloLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textColor = .black
        self.addSubview(label)
        return label
    }()
    
    private lazy var searchBar : UISearchBar = {
        

        let imageView : UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(systemName: "switch.2")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
            return imageView
        }()
        
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        searchBar.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }

        self.addSubview(searchBar)
        return searchBar
    }()
    
    
    
    public func setupView(name: String) -> Topbar {
        
        helloLabel.text = "Hello, \(name) 👋🏻"
        
        logoImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(16)
            make.width.height.equalTo(48)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(logoImage.snp.centerY)
            make.left.equalTo(logoImage.snp.right).offset(16)
        }
        
        bellImage.snp.makeConstraints { make in
            make.centerY.equalTo(logoImage.snp.centerY)
            make.right.equalTo(bookmarkImage.snp.left).offset(-16)
            make.width.height.equalTo(32)

        }
        
        bookmarkImage.snp.makeConstraints { make in
            make.centerY.equalTo(logoImage.snp.centerY)
            make.right.equalToSuperview()
            make.width.height.equalTo(32)
        }
        
        helloLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(16)
            make.top.equalTo(logoImage.snp.bottom).offset(16)
        }
        
        searchBar.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.top.equalTo(helloLabel.snp.bottom)
            make.bottom.equalToSuperview()
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
