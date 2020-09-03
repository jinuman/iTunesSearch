//
//  FilterComponent.swift
//  iTunesSearchApp
//
//  Created by Mustafa ÖZDEMİR on 2.09.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import Foundation
import RxSwift
import Swinject
import SwinjectAutoregistration

class FilterComponent {
    
    public static func register(_ container: Container) {
        
        container.autoregister(FilterViewModel.self, initializer: FilterViewModel.init)
                        
        container.register(FilterViewController.self) { r in
            let vc = FilterViewController()
            vc.viewModel = r.resolve(FilterViewModel.self)
            vc.disposeBag = r.resolve(DisposeBag.self)
            return vc
        }
        
    }
    
}


