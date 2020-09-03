//
//  SearchResultCell.swift
//  iTunesSearchApp
//
//  Created by Mustafa ÖZDEMİR on 2.09.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import UIKit
import Kingfisher

class SearchResultCell: UICollectionViewCell {
    
    var cellData: Content? {
        didSet {
            guard let _content = self.cellData else {return}
            nameLabel.text = _content.trackName
            imgView.kf.setImage(with: URL(string: _content.artworkUrl100 ?? ""))
        }
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white        
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.backgroundColor = .black
        return label
    }()
    
    let imgView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        return imgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.imgView.clipsToBounds = true
        self.clipsToBounds = true
        self.backgroundColor = .white
        
        addSubview(imgView)
        imgView.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalToSuperview()
        }
        
        self.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
