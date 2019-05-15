//
//  SBUtil.swift
//  SurveyBeats
//
//  Created by Vikasmishra on 14/05/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

class SBUtil {
    static func getPostRequestStringForFormData(params:[String: Any]) -> String {
        var data = [String]()
        for(key, value) in params
        {
            data.append(key + "=\(value)")
        }
        return data.map { String($0) }.joined(separator: "&")
    }
    
    static func setAccessToken(token: String) {
        UserDefaults.standard.set(token, forKey: SBStringConstants.kAccessTokenKey)
        
    }
    
    static func getAccessToken() -> String? {
        return UserDefaults.standard.value(forKey: SBStringConstants.kAccessTokenKey) as? String
    }
}
