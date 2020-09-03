//
//  SearchComponent.swift
//  iTunesSearchApp
//
//  Created by Mustafa ÖZDEMİR on 2.09.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import Foundation
import RxSwift
import Swinject
import SwinjectAutoregistration

class SearchComponent {
    
    public static func register(_ container: Container) {
        
        container.autoregister(SearchRepository.self, initializer: SearchRepository.init)
        container.autoregister(SearchViewModel.self, initializer: SearchViewModel.init)
        
        container.register(SearchViewController.self) { r in
            let vc = SearchViewController()
            vc.viewModel = r.resolve(SearchViewModel.self)
            vc.disposeBag = r.resolve(DisposeBag.self)
            vc.container = container
            return vc
        }
        
    }
    
}
