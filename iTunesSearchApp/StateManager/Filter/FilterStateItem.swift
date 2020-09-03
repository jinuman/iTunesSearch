//
//  FilterStateItem.swift
//  iTunesSearchApp
//
//  Created by Mustafa ÖZDEMİR on 3.09.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import Foundation
import RealmSwift

enum FilterStateAction: StateProtocol {
    case upsert(FilterStateDTO)
    case remove(String)
    case removeAll
}

class FilterStateObject: Object, StateProtocol {
    @objc dynamic var id = ""
    @objc dynamic var title = ""
    @objc dynamic var selected = false
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

public struct FilterStateListDTO: StateProtocol {
    let taskStateList: Array<FilterStateObject>
}

public struct FilterStateDTO {
    public var id: String
    public var title: String
    public var selected: Bool
    
    public init(_ id: String, title: String, selected: Bool) {
        self.id = id
        self.title = title
        self.selected = selected
    }
}
