//
//  FilterStateManager.swift
//  iTunesSearchApp
//
//  Created by Mustafa ÖZDEMİR on 3.09.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RealmSwift

public class FilterStateManager: StateManagerProtocol {
         
    var taskStateObject = FilterStateObject()
    let database = RealmProducer.getRealm()
    
    public var behaviorRelay: BehaviorRelay<StateProtocol>
    static let filterStateManager = FilterStateManager()
    
    init() {
        behaviorRelay = BehaviorRelay<StateProtocol>(value: FilterStateListDTO(taskStateList: []))
        behaviorRelay.accept(getItemsFromDb())
    }
    
    public static func getInstance() -> StateManagerProtocol {
        return filterStateManager
    }

    public  func update<T>(_ action: T, success: (() -> Void)?) where T : StateProtocol {
        let _action = action as! FilterStateAction
        switch _action {
        case .upsert(let dto):
            self.upsert(dto, success: success)
        case .remove(let id):
            self.remove(id, success: success)
        case .removeAll:
            self.removeAll(success)
        }
    }
    
    func getItemsFromDb() -> FilterStateListDTO {
        return FilterStateListDTO(taskStateList: Array(database.objects(FilterStateObject.self)))
    }
    
    private func upsert(_ taskStateDTO: FilterStateDTO, success: (() -> Void)?) {
        let taskStateObject = FilterStateObject()
        taskStateObject.id = taskStateDTO.id
        taskStateObject.title = taskStateDTO.title
        taskStateObject.selected = taskStateDTO.selected
        try? database.write {
            database.add(taskStateObject, update: .all)
        }
        let dbItems = self.getItemsFromDb()
        self.behaviorRelay.accept(dbItems)
        success?()
    }
    
    private func remove(_ id : String, success: (() -> Void)?){
        let object = database.objects(FilterStateObject.self).filter("id = %@", id).first
        try? database.write {
            if let obj = object {
                database.delete(obj)
                self.behaviorRelay.accept(getItemsFromDb())
                success?()
            }
        }
    }
    
    private func removeAll(_ success: (() -> Void)?){
        let objects = database.objects(FilterStateObject.self)
        try? database.write {
            database.delete(objects)
            self.behaviorRelay.accept(getItemsFromDb())
            success?()
        }
    }
}

