//
//  BaseService.swift
//  AppsLinkTask
//
//  Created by Sherif Abd El-Moniem on 28/11/2021.
//

import Foundation
import Alamofire


class BaseService : NSObject {
  
  var sharedHeaders: HTTPHeaders {
    get{
      let sharedHeaders : HTTPHeaders =  [
        "Content-Type": "application/json" ,
        "Authorization":"Bearer " + "" ,
        "Accept-Language" : ""
      ]
      return sharedHeaders
    }
  }
  
  
}
