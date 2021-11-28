//
//  JSON+getValues.swift
//  AppsLinkTask
//
//  Created by Sherif Abd El-Moniem on 28/11/2021.
//


import Foundation
import SwiftyJSON

extension JSON {
    func getStringValue (forKey: String) -> String {
        if let returnedData = self[forKey].string  {
                return returnedData
        }
        return ""
    }
    func getIntValue (forKey: String) -> Int {
        if let returnedData = self[forKey].int {
                return returnedData
        }
        return 0
    }
    func getDoubleValue (forKey: String) -> Double {
        if let returnedData = self[forKey].double {
                return returnedData
        }
        return 0.0
    }
    func getBoolValue (forKey: String) -> Bool {
        if let returnedData = self[forKey].bool{
                return returnedData
        }
        return false
    }

    func getIntArray (forKey: String) -> [Int] {
        if let returnedData = self[forKey].arrayObject as? [Int] {
                return returnedData
        }
        let emptyArray: [Int] = []
        return emptyArray
    }

}
