//
//  FilterViewModel.swift
//  iTunesSearchApp
//
//  Created by Mustafa ÖZDEMİR on 3.09.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import Foundation
import RxSwift

final class FilterViewModel {
    
    var disposeBag: DisposeBag!
    
    internal let filters = [
        Filter(name: "All", selected: true),
        Filter(name: "Music", selected: false),
        Filter(name: "Movie", selected: false),
        Filter(name: "Podcast", selected: false)
    ]
    
    init(disposeBag: DisposeBag) {
        self.disposeBag = disposeBag
    }
    
}
