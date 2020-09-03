//
//  AppDelegate.swift
//  iTunesSearchApp
//
//  Created by Mustafa ÖZDEMİR on 31.08.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import UIKit
import RxSwift
import Swinject

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    internal let container = Container()
    private var appCoordinator: AppCoordinator!
    
    func application(_ application: UIApplication,
                     willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        initDependencyGraph()
        return true
    }

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()
        appCoordinator = AppCoordinator(window: window!, container: container)
        appCoordinator.start(AppMainScene.app, data: [])
        window?.makeKeyAndVisible()
                
        return false
    }
    
}

