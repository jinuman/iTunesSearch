//
//  String+Extensions.swift
//  iTunesSearchApp
//
//  Created by Mustafa ÖZDEMİR on 2.09.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import Foundation

extension String {
  var urlEscaped: String? {
    return addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
  }
}
