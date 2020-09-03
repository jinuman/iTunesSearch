//
//  SearchViewController.swift
//  iTunesSearchApp
//
//  Created by Mustafa ÖZDEMİR on 31.08.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import UIKit
import RxSwift
import SnapKit
import Swinject

final class SearchViewController: BaseViewController {
    
    internal let navigationView = SearchNavigationView()
    internal var collectionView: UICollectionView!
    
    var viewModel: SearchViewModel!
    var disposeBag: DisposeBag!
    var container: Container!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIControls()
    }
    
    private func setupUIControls() {
        setupCollectionView()
        setupNavigationBar()
    }    
    
    private func setupNavigationBar() {
        navigationItem.titleView = navigationView
        navigationView.navigationSubject = self.navigationSubject
        
        let searchBarObservable = navigationView
            .searchBar
            .rx.text
            .orEmpty
            .debounce(RxTimeInterval.seconds(Int(0.5)), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            
        
        let stateManagerObservable = StateManager.getInstance().get(.filter).behaviorRelay
        
        Observable
            .combineLatest(searchBarObservable, stateManagerObservable)
            .subscribe(onNext: { [weak self] event, state in
                let dto = SearchDTO(term: String(event), media: "")
                self?.viewModel.getSearchResults(dto: dto, filterType: "")
            }).disposed(by: disposeBag)
                        
    }
    
}
