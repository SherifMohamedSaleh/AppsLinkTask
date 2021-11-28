//
//  Connectivity.swift
//  AppsLinkTask
//
//  Created by Sherif Abd El-Moniem on 28/11/2021.
//

import Foundation
import Alamofire

class Connectivity : NSObject {
    
    static let sharedConnectivityInstance : Connectivity = {
        return Connectivity()
    }()
    
    var reachability: NetworkReachabilityManager!
    
    override init() {
        super.init()
        // Initialise reachability
        reachability = NetworkReachabilityManager()
    }
    
    // Network observable
    func startNetworkReachabilityObserver(completed: @escaping (NetworkReachabilityManager.NetworkReachabilityStatus) -> Void) {
        reachability.startListening { status in
            completed(status)
        }
    }
}

