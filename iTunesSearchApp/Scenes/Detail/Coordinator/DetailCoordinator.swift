//
//  DetailCoordinator.swift
//  iTunesSearchApp
//
//  Created by Mustafa ÖZDEMİR on 2.09.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import UIKit

public enum DetailScene: String, AppScene {
    
    case back = "back"
    case detail = "detail"
    
    public var name: String {
        return self.rawValue
    }
    
    public var identifier: String {
        return "Detail"
    }
    
    public var coordinator: BaseCoordinator.Type{
        return DetailCoordinator.self
    }
}

final class DetailCoordinator: BaseCoordinator {
    
    override func start(_ name:AppScene, data:Any) {
        guard let detailViewController = container.resolve(DetailViewController.self) else {return}
        viewController = detailViewController.self
        
        let _data = data as! [String:Any]
        (viewController as! DetailViewController).content = _data["content"] as? Content
        
        self.initializeNavigationService()
        navigationController.pushViewController(viewController, animated: true)
    }
    
    override func navigate(scene: AppScene, data: Any) {
    }
    
    override func back(_ viewController: UIViewController) {
    }
}

