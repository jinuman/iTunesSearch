//
//  MockService.swift
//  iTunesSearchApp
//
//  Created by Mustafa ÖZDEMİR on 3.09.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import Foundation
import iTunesSearchApp

public class MockService {
    
    public static func readJsonFile() -> Array<Content>? {
        let bundle = Bundle(for: MockService.self)
        guard let path = bundle.path(forResource: "sample", ofType: "json") else {return nil}
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {return nil}
        let decoder = JSONDecoder()
        guard let parsedJson = try? decoder.decode(ApiResponse.self, from: data) else {return nil}
        return parsedJson.results        
    }
    
}
