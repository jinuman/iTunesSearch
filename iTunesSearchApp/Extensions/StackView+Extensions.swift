//
//  StackView+Extensions.swift
//  iTunesSearchApp
//
//  Created by Mustafa ÖZDEMİR on 3.09.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import UIKit

extension UIStackView {
    
    func removeFirstArrangedView() {
        
        for item in arrangedSubviews {
            removeArrangedSubview(item)
            item.removeFromSuperview()
            break
        }
    }
    
    
    func removeLastArrangedView() {
        
     var i=1
        for item in arrangedSubviews {
            if i == arrangedSubviews.count {
                removeArrangedSubview(item)
                item.removeFromSuperview()
            }
            i+=1
        }
    }
    
    func removeAllArrangedSubviews() {
        
        let removedSubviews = arrangedSubviews.reduce([]) { (allSubviews, subview) -> [UIView] in
            self.removeArrangedSubview(subview)
            return allSubviews + [subview]
        }
        
        NSLayoutConstraint.deactivate(removedSubviews.flatMap({ $0.constraints }))
        removedSubviews.forEach({ $0.removeFromSuperview() })
    }
}
