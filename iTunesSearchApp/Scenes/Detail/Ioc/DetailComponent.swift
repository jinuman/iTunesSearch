//
//  DetailComponent.swift
//  iTunesSearchApp
//
//  Created by Mustafa ÖZDEMİR on 2.09.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import Foundation
import RxSwift
import Swinject
import SwinjectAutoregistration

class DetailComponent {
    
    public static func register(_ container: Container) {
                        
        container.register(DetailViewController.self) { r in
            let vc = DetailViewController()            
            vc.disposeBag = r.resolve(DisposeBag.self)
            return vc
        }
        
    }
    
}

