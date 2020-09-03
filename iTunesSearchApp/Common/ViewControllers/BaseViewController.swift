//
//  BaseViewController.swift
//  iTunesSearchApp
//
//  Created by Mustafa ÖZDEMİR on 2.09.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import UIKit
import RxSwift

public class BaseViewController: UIViewController {
    
    public let navigationSubject = PublishSubject<Navigation<Any>>()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 13.0, *) {
            self.overrideUserInterfaceStyle = .light
        }
        
        setGradientColor()
    }
    
    private func setGradientColor() {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [UIColor(rgb: 0x46D2FD).cgColor, UIColor(rgb: 0x5351F0).cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.view.layer.insertSublayer(gradient, at: 0)
    }
    
}

extension BaseViewController: UINavigationControllerDelegate, UIGestureRecognizerDelegate {
    
    public func navigationController(_ navigationController: UINavigationController,
                                     didShow viewController: UIViewController,
                                     animated: Bool) {
        
        if (navigationController.viewControllers.count > 1) {
            self.navigationController?.interactivePopGestureRecognizer?.delegate = self
            navigationController.interactivePopGestureRecognizer?.isEnabled = true;
        } else {
             self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
            navigationController.interactivePopGestureRecognizer?.isEnabled = false;
        }
    }
    
}

