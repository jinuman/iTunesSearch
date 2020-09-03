//
//  SearchRepository.swift
//  iTunesSearchApp
//
//  Created by Mustafa ÖZDEMİR on 31.08.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import Foundation
import RxSwift
import RxMoya

final class SearchRepository {
    
    func getSearchResults(dto: SearchDTO) -> Observable<Array<Content>?> {
        return provider.rx
            .request(.search(dto))
            .observeOn(MainScheduler.instance)
            .map(ApiResponse.self)
            .map{$0.results}
        .asObservable()
    }
    
}
