//
//  Tag.swift
//  booking-list-view
//
//  Created by Rza Ismayilov on 21.04.22.
//

import UIKit
import SnapKit

class Tag : UIView {
    
    private lazy var tagLabel : UILabel = {
        let label = UILabel()
        label.textColor = .systemGreen
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        self.addSubview(label)
        return label
    }()
    
    public func setupView(tagName : String) -> Tag {
        
        self.backgroundColor = .white
        self.layer.borderColor = UIColor.systemGreen.cgColor
        self.layer.cornerRadius = 18
        self.layer.borderWidth = 2
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clicked)))
        
        tagLabel.text = tagName
        
        tagLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        return self
    }
    
    @objc func clicked() {
        if (self.backgroundColor == .white) {
            self.backgroundColor = .systemGreen
            tagLabel.textColor = .white
        } else {
            self.backgroundColor = .white
            tagLabel.textColor = .systemGreen
        }
//        self.backgroundColor = self.backgroundColor == .systemGreen ? .white : .systemGreen
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
