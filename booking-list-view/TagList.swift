//
//  TagList.swift
//  booking-list-view
//
//  Created by Rza Ismayilov on 21.04.22.
//

import UIKit
import SnapKit

class TagList : UIScrollView {
    
    private var tagNames : [String] = [
        "Recommended",
        "Popular",
        "Trending",
        "Hightest Ranked",
        "Cheapest"
    ]
    
    private lazy var tags : [Tag] = {
        var tags : [Tag] = []
        for name in tagNames {
            let btn = Tag().setupView(tagName: name)
            tags.append(btn)
        }
        return tags
    }()
    
    private lazy var stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 16
        self.addSubview(stackView)
        return stackView
    }()
    
    private func setupView() {

        stackView.snp.makeConstraints { make in
            make.top.equalTo(self.contentLayoutGuide.snp.top).offset(16)
            make.right.equalTo(self.contentLayoutGuide.snp.right).offset(-16)
            make.left.equalTo(self.contentLayoutGuide.snp.left).offset(16)
            make.bottom.equalTo(self.contentLayoutGuide.snp.bottom).offset(-16)
            make.centerY.equalTo(self.snp.centerY)
        }
        
        for tag in tags {
            stackView.addArrangedSubview(tag)
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
