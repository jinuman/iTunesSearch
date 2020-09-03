//
//  FilterTypeView.swift
//  iTunesSearchApp
//
//  Created by Mustafa ÖZDEMİR on 2.09.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import UIKit
import RxSwift

final class FilterTypeView: UIView {
        
    let disposeBag = DisposeBag()
    let stateManager = StateManager.getInstance()
    
    var model: Filter! {
        didSet {
            nameLabel.text = model.name
            imgView.image = model.selected ? UIImage(named: "checked") : UIImage(named: "unchecked")
        }
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .left
        return label
    }()
    
    let imgView: UIImageView = {
        let imageView = UIImageView()        
        return imageView
    }()
    
    let selectButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        self.backgroundColor = .white
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 20
        
        self.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(50)
        }
        
        self.addSubview(imgView)
        imgView.snp.makeConstraints { make in
            make.width.height.equalTo(30)
            make.trailing.equalToSuperview().offset(-50)
            make.centerY.equalToSuperview()
        }
        
        self.addSubview(selectButton)
        selectButton.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalToSuperview()
        }
        
        selectButton
            .rx.tap
            .subscribe(onNext: { [weak self] in
                guard let _model = self?.model else {return}
                let dto = FilterStateDTO("0", title: _model.name, selected: !_model.selected)
                try? self?.stateManager.get(.filter).update(FilterStateAction.upsert(dto), success: {
                    print("upserted")
                })
            }).disposed(by: disposeBag)
    }
}
