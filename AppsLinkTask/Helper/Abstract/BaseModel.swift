//
//  BaseModel.swift
//  AppsLinkTask
//
//  Created by Sherif Abd El-Moniem on 28/11/2021.
//


import Foundation
import SwiftyJSON

class BaseModel {
    
    
    var id : Int = -1
    var data = JSON()
    
    init() {}
    
    required init(data : JSON){
        self.data = data
        id = data.getIntValue(forKey: "id")
        if id == 0 {
            id = -1
        }
    }
    
}

extension BaseModel: Hashable {
    static func == (lhs: BaseModel, rhs: BaseModel) -> Bool {
        return lhs === rhs
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self).hashValue)
    }
}
