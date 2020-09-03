//
//  NavigationService.swift
//  iTunesSearchApp
//
//  Created by Mustafa ÖZDEMİR on 2.09.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import UIKit
import RxSwift
import Swinject

public class NavigationService {
    
    static var navigationService: NavigationService?
    static var navigationStack: [AppScene] = [AppMainScene.app]
    
    let disposeBag: DisposeBag
    let container: Container
    
    //prevent initialize object
    private init(_ container:Container, disposeBag: DisposeBag){
        self.disposeBag = disposeBag
        self.container = container
    }
    
    static func  requestNavigationObject() throws -> NavigationService {
        guard let _ = navigationService else {
          throw NavigationError.navigationObjectNotCreated
        }
        return navigationService!
    }
    
    public static func initializeNavigationService(_ container:Container, disposeBag: DisposeBag, fromViewController: BaseViewController?){
        navigationService = NavigationService(container, disposeBag: disposeBag)
    }

    public func start(fromViewController: BaseViewController,
                      navigationController: BaseNavigationController,
                      prevCoordinator:BaseCoordinator,
                      nextScene: AppScene,
                      data: Any) throws{
                
        fromViewController.navigationController?.delegate = fromViewController
        
        //checkBack
        if nextScene.name == "back" {
            NavigationService.backScene()
            prevCoordinator.back(fromViewController)
            return
        }

        //creating nextScene Coordinator from enum
        let nextSceneCoordinator = nextScene.coordinator
        
        NavigationService.setCurrentScene(scene: nextScene)
        nextSceneCoordinator.init(container: self.container,
                   navigationController: navigationController,
                   disposeBag: self.disposeBag, fromViewController:fromViewController)
            .start(nextScene, data:data)
        }
}


extension NavigationService {
    
    static func setCurrentScene(scene: AppScene){
        NavigationService.navigationStack.append(scene)
    }
    
    static func backScene(){
        if NavigationService.navigationStack.count > 1 {
            NavigationService.navigationStack.removeLast()
        }
    }
    
    static func getCurrentScene() -> AppScene{
        return NavigationService.navigationStack.last ?? SearchScene.search
    }
}
