//
//  HomeServices.swift
//  AppsLinkTask
//
//  Created by Sherif Abd El-Moniem on 28/11/2021.
//

import Foundation

class HomeServices  : BaseService {
    // sharedHeaders in BaseService to call each time withoud hard coded

    func getAllTechnologies(success: @escaping ((_ response : BaseModel)-> Void) ,failure: @escaping (()-> Void)){
        let path : String = String(format: "server URL")
        NetworkManager.shared().performRequestWithPath(baseUrl: path, path: nil, requestMethod: .get, requestParam: nil , headersParam: sharedHeaders , encoding: .default , success: { (response) in
            let searchResult  : BaseModel = BaseModel()  //= TechnologyModel()
//            if let data = responce["data"]["technology"].array {
//                if  let technology = TechnologyModel.arrayFromInstance(array: data) {
//                    searchResult.technology = technology
//                }
//            }
            success(searchResult)
            
        }) {
            failure ()
        }
    }
}


