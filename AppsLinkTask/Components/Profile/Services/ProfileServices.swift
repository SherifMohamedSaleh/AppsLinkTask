//
//  ProfileServices.swift
//  AppsLinkTask
//
//  Created by Sherif Abd El-Moniem on 28/11/2021.
//
import Foundation
import Alamofire
import SwiftyJSON

class ProfileServices : BaseService {
     // sharedHeaders in BaseService to call each time withoud hard coded
    
    func getUserProfile(success: @escaping ((_ getUserProfileResponse : UserModel)-> Void) ,failure: @escaping (()-> Void)){
        
        let path : String = String(format: "server url")
        
        
        NetworkManager.shared().performRequestWithPath(baseUrl: path, path: nil, requestMethod: .get, requestParam: nil , headersParam: sharedHeaders, encoding: .default , success: { (response) in
            if let data = response["data"]["user"].dictionary {
                let currentUser = UserModel.init(data:JSON(data))
                success(currentUser)
            }
        }) {
            failure ()
            
        }
    }
}

