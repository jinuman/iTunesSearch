//
//  AppCoordinator.swift
//  iTunesSearchApp
//
//  Created by Mustafa ÖZDEMİR on 2.09.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import os.log
import UIKit
import RxSwift
import Swinject

enum AppMainScene: String, AppScene {
    
    case app = "app"
    case homePage = "homepage"
    case detailPage = "detailPage"
    case filterPage = "filterPage"
    
    var name: String {
        return self.rawValue
    }
    
    public var identifier: String {
        return "AppMain"
    }
    
    var coordinator: BaseCoordinator.Type{
        return BaseCoordinator.self
    }

}

final class AppCoordinator: CoordinatorProtocol {

    // MARK: - Properties
    private let window: UIWindow
    private let disposeBag: DisposeBag = DisposeBag()

    let container: Container

    init(window: UIWindow, container: Container) {
        self.window = window
        self.container = container
        
        NavigationService.initializeNavigationService(container,
                                                      disposeBag: disposeBag,
                                                      fromViewController: nil)
    }

    func start(_ name: AppScene, data:Any) {
                                
        if let searchViewController = container.resolve(SearchViewController.self) {
            let navigationController = BaseNavigationController(rootViewController: searchViewController)
            self.window.rootViewController = navigationController
            
            searchViewController.navigationSubject.subscribe(onNext: { navigation in
                
                let searchCoordinator = SearchCoordinator(container: self.container,
                                                          navigationController: navigationController,
                                                          disposeBag: self.disposeBag,
                                                          fromViewController: nil)
                
                try! NavigationService
                    .requestNavigationObject()
                    .start(fromViewController: searchViewController,
                           navigationController: navigationController,
                           prevCoordinator: searchCoordinator,
                           nextScene: navigation.scene,
                           data: navigation.data)                
                
            }).disposed(by: disposeBag)
        }
                                
    }
    
    func navigate(scene: AppScene, data: Any) {
    }
    
    func back(_ viewController: UIViewController) {
    }

}
