//
//  NetworkManager.swift
//  AppsLinkTask
//
//  Created by Sherif Abd El-Moniem on 28/11/2021.
//

import UIKit
import Alamofire
import SwiftyJSON


enum ServerStatusCodes : Int {
    case Successed = 200
    case SessionExpired = 401
    case ValidationError = 400
    case ServerError  = 500
}


typealias SuccessNetworkClousre = (JSON)  -> Void
typealias FailureNetworkClousre = () -> Void

public class NetworkManager {
    
    
    
    private static var privateShared : NetworkManager?
    private let queue = OperationQueue()
    
    
    class func shared() -> NetworkManager {
      guard let uwShared = privateShared else {
        privateShared = NetworkManager()
        privateShared?.queue.maxConcurrentOperationCount = 1
        return privateShared!
        
      }
      return uwShared
    }
    
    static let sharedSessionManager: Alamofire.Session = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60
        return Alamofire.Session(configuration: configuration)
    }()
    
    func performRequestWithPath (baseUrl          :String?,
                                 path             :String?,
                                 requestMethod    :Alamofire.HTTPMethod,
                                 requestParam     :[String: Any]?,
                                 headersParam     :HTTPHeaders?,
                                 encoding         :JSONEncoding?,
                                 expectJSONResponse:Bool = true ,
                                 success          :@escaping SuccessNetworkClousre,
                                 failure          :@escaping FailureNetworkClousre){
        
        let url = (path != nil) ? baseUrl! + path! : baseUrl
        if !expectJSONResponse{
            // dowenload files or pdfsßßßßß
            NetworkManager.sharedSessionManager.request(URL.init(string: url!)!, method: requestMethod, parameters: requestParam, encoding: encoding!, headers: headersParam)
                .response{ (responce) in
                    success(JSON(rawValue: responce.response!) ?? "")
                }
        }else {
            if let encoding = encoding {
                NetworkManager.sharedSessionManager.request(URL.init(string: url!)!, method: requestMethod, parameters: requestParam, encoding: encoding, headers: headersParam )
                    .validate()
                    .responseJSON { (response) in
                        switch response.result {
                        case  .success(_):
                            success(JSON(rawValue: response.response!) ?? "")
                            break
                        case .failure(_):
                            if let status = response.response?.statusCode  {
                                
                                if status == ServerStatusCodes.SessionExpired.rawValue {
                                    failure()
                                }
                                else{
                                    failure()
                                }
                            }
                            failure()
                        }
                    }
            }
        }
    }
}
