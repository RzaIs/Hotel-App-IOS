//
//  ViewController.swift
//  booking-list-view
//
//  Created by Rza Ismayilov on 16.04.22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var topbar : Topbar = {
        var topbar = Topbar().setupView(name: "Rza")
        self.view.addSubview(topbar)
        return topbar
    }()
    
    private lazy var hotelList : HotelList = {
        var hotelList = HotelList()
        self.view.addSubview(hotelList)
        return hotelList
    }()
    
    private lazy var navbar : Navbar = {
        var navbar = Navbar()
        self.view.addSubview(navbar)
        return navbar
    }()
    
    private lazy var tagList : TagList = {
        let tagList = TagList()
        self.view.addSubview(tagList)
        return tagList
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
      
        topbar.snp.makeConstraints { make in
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(8)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-8)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
        }
        
        tagList.snp.makeConstraints { make in
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(8)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-8)
            make.top.equalTo(topbar.snp.bottom)
        }
                
        hotelList.snp.makeConstraints { make in
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(8)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-8)
            make.bottom.equalTo(navbar.snp.top).offset(-8)
            make.top.equalTo(tagList.snp.bottom)
        }
        
        navbar.snp.makeConstraints { make in
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(8)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-8)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-8)
        }
    }
}
