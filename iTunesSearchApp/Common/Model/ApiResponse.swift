//
//  ApiResponse.swift
//  iTunesSearchApp
//
//  Created by Mustafa ÖZDEMİR on 2.09.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import Foundation

public struct ApiResponse: Decodable {
    let results: Array<Content>?
    let resultCount: Int?        
}
