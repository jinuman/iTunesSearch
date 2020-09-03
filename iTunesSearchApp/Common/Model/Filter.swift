//
//  Filter.swift
//  iTunesSearchApp
//
//  Created by Mustafa ÖZDEMİR on 3.09.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import Foundation

struct Filter {
    let id = UUID().uuidString
    let name: String
    var selected: Bool
}
