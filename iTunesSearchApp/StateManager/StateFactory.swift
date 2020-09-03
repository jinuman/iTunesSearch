//
//  StateFactory.swift
//  iTunesSearchApp
//
//  Created by Mustafa ÖZDEMİR on 3.09.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import Foundation
import RxSwift

public enum StateItem {
    case filter
}

public protocol StateFactoryProtocol{
    static func getManager(_ stateItem: StateItem) -> StateManagerProtocol
}

class StateFactory : StateFactoryProtocol{
    public static func getManager(_ stateItem: StateItem) -> StateManagerProtocol {
        switch stateItem {
        case .filter:
            return FilterStateManager.getInstance()
        }
    }
}

