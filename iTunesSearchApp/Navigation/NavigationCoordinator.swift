//
//  NavigationCoordinator.swift
//  iTunesSearchApp
//
//  Created by Mustafa ÖZDEMİR on 2.09.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import Swinject
import UIKit
import RxSwift

public protocol NavigationCoordinator: CoordinatorProtocol  {
}

extension NavigationCoordinator where Self: BaseCoordinator {
    func initializeNavigationService(){
        self.viewController.navigationSubject.subscribe(onNext: { (navigation) in
            try! NavigationService.requestNavigationObject()
                .start(fromViewController: self.viewController,
                       navigationController: self.navigationController,
                       prevCoordinator: self,
                       nextScene: navigation.scene,
                       data: navigation.data)
        }).disposed(by: self.disposeBag)
    }
}
