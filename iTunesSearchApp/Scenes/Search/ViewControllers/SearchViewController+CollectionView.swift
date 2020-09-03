//
//  SearchViewController+CollectionView.swift
//  iTunesSearchApp
//
//  Created by Mustafa ÖZDEMİR on 2.09.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import Foundation
import UIKit

extension SearchViewController {
    
    internal func setupCollectionView() {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        layout.itemSize = CGSize(width: (view.frame.width - 50) / 3 , height: 100)
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeArea.top)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        registerCollectionViewCells()
        setupCollectionViewDataBinding()
        
        collectionView
            .rx
            .itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                
                guard let cell = self?.collectionView.cellForItem(at: indexPath) as? SearchResultCell else {return}
                guard let content = cell.cellData else {return}
                self?.navigationSubject.onNext(Navigation<Any>(DetailScene.detail, data:["content":content]))
                
            }).disposed(by: disposeBag)
    }
    
    private func registerCollectionViewCells() {
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: "SearchResultCell")
    }
    
    private func setupCollectionViewDataBinding() {
        viewModel
            .behaviorRelay
            .bind(to: collectionView.rx.items(cellIdentifier: "SearchResultCell", cellType: SearchResultCell.self)) {a, b, c in
                c.cellData = b
            }.disposed(by: disposeBag)
    }
    
}
