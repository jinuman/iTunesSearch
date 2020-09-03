//
//  FilterCoordinator.swift
//  iTunesSearchApp
//
//  Created by Mustafa ÖZDEMİR on 2.09.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import UIKit

public enum FilterScene: String, AppScene {
    
    case back = "back"
    case filter = "filter"
    
    public var name: String {
        return self.rawValue
    }
    
    public var identifier: String {
        return "Filter"
    }
    
    public var coordinator: BaseCoordinator.Type{
        return FilterCoordinator.self
    }
}

final class FilterCoordinator: BaseCoordinator {
    
    override func start(_ name:AppScene, data:Any) {
        guard let filterViewController = container.resolve(FilterViewController.self) else {return}
        viewController = filterViewController.self
        self.initializeNavigationService()
        navigationController.pushViewController(viewController, animated: true)
    }
    
    override func navigate(scene: AppScene, data: Any) {
    }
    
    override func back(_ viewController: UIViewController) {
    }
}


