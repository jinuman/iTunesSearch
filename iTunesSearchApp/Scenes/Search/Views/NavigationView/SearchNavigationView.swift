//
//  SearchNavigationView.swift
//  iTunesSearchApp
//
//  Created by Mustafa ÖZDEMİR on 2.09.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import UIKit
import RxSwift

final class SearchNavigationView: UIView {
    
    var searchBar = UISearchBar()
    let disposeBag = DisposeBag()
    var navigationSubject: PublishSubject<Navigation<Any>>!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupNavBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return UIView.layoutFittingExpandedSize
    }
    
    func setupNavBar() {
        
        let filterButton = UIButton(type: .custom)
        addSubview(filterButton)
        filterButton.snp.makeConstraints { make in
            make.top.bottom.trailing.equalToSuperview()
        }
        filterButton.setTitle("Filter", for: .normal)
        filterButton.setTitleColor(.black, for: .normal)
        filterButton.addTarget(self, action: #selector(filterClicked), for: .touchUpInside)
                    
                        
        addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.top.bottom.leading.equalToSuperview()
            make.trailing.equalTo(filterButton.snp_leadingMargin).offset(-20)
        }
        
        searchBar.rx
            .searchButtonClicked
            .subscribe(onNext: { () in
                self.searchBar.resignFirstResponder()
            }).disposed(by: disposeBag)
    }
    
    @objc func filterClicked() {
        navigationSubject.onNext(Navigation<Any>(FilterScene.filter, data:["":""]))
    }
}
