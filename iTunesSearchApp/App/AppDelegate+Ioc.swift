//
//  AppDelegate+Ioc.swift
//  iTunesSearchApp
//
//  Created by Mustafa ÖZDEMİR on 2.09.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import Foundation
import RxSwift
import Swinject
import SwinjectAutoregistration

extension AppDelegate {
    
    internal func initDependencyGraph() {
        self.registerGlobalDependencies(container)
        
        SearchComponent.register(container)
        DetailComponent.register(container)
        FilterComponent.register(container)
    }
    
    private func registerGlobalDependencies(_ container: Container){
        
        //DisposeBag
        //Singleton
        container.autoregister(DisposeBag.self, initializer: DisposeBag.init)
            .inObjectScope(.container)
        
    }
    
}
