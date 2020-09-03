//
//  DetailViewController.swift
//  iTunesSearchApp
//
//  Created by Mustafa ÖZDEMİR on 2.09.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import UIKit
import RxSwift
import Kingfisher

final class DetailViewController: BaseViewController {
    
    var disposeBag: DisposeBag!
    var content: Content! {
        didSet {
            artistLabel.text = content.artistName
            trackLabel.text = content.collectionName
            nameLabel.text = content.trackName
            imgView.kf.setImage(with: URL(string: content.artworkUrl100 ?? ""))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(imgView)
        imgView.snp.makeConstraints { make in
            make.top.equalTo(view.safeArea.top)
            make.centerX.equalToSuperview()
            make.width.height.equalToSuperview().multipliedBy(0.4)
        }
        
        view.addSubview(artistLabel)
        artistLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(imgView.snp_bottomMargin).offset(20)
        }
        
        view.addSubview(trackLabel)
        trackLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(artistLabel.snp_bottomMargin).offset(20)
        }
        
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(trackLabel.snp_bottomMargin).offset(20)
        }
                
                
    }
    
    let imgView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let artistLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let trackLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
}
