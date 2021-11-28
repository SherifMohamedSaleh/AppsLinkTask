//
//  UserModel.swift
//  AppsLinkTask
//
//  Created by Sherif Abd El-Moniem on 28/11/2021.
//

import Foundation

import Foundation
import SwiftyJSON

class UserModel: BaseModel {
    var organization: String = ""
    var username: String = ""
    var password: String = ""
    
    override init() {
        super.init()
    }
    required  init(data: JSON) {
        super.init(data: data)
        organization = data.getStringValue(forKey: "organization")
        username = data.getStringValue(forKey: "organization")
        password = data.getStringValue(forKey: "password")

    }
}
extension UserModel {
    func parseJSON(value: JSON) {
        parseJSONPersonalData(value: value)
    }
    private func parseJSONPersonalData(value: JSON) {
        if let userId = value["id"].int {
            id = userId
        }
        if let userOrganization = value["organization"].string {
            organization = userOrganization
        }
        if let userName = value["username"].string {
            username = userName
        }
    if let userPassword = value["password"].string {
            password = userPassword
        }
    }
}
