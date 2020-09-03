//
//  UIView+Extensions.swift
//  iTunesSearchApp
//
//  Created by Mustafa ÖZDEMİR on 2.09.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import UIKit
import SnapKit

extension UIView {
    var safeArea : ConstraintLayoutGuideDSL {
        return safeAreaLayoutGuide.snp
    }
}
