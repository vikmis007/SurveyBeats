//
//  SBUtil.swift
//  SurveyBeats
//
//  Created by Vikasmishra on 14/05/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import Foundation

// MARK: - Utility class
class SBUtil {

    /// Get string formatted form data from dictionary
    ///
    /// - Parameter params: dictionary
    /// - Returns: form data in string format
    static func getPostRequestStringForFormData(params: [String: Any]) -> String {
        var data = [String]()
        for(key, value) in params {
            data.append(key + "=\(value)")
        }
        return data.map { String($0) }.joined(separator: "&")
    }

    /// This method will set access token in user defaults
    ///
    /// - Parameter token: token to be saved
    static func setAccessToken(token: String?) {
        UserDefaults.standard.set(token, forKey: SBStringConstants.kAccessTokenKey)

    }

    /// This method will get access token from user defaults
    ///
    /// - Returns: token string
    static func getAccessToken() -> String? {
        return UserDefaults.standard.value(forKey: SBStringConstants.kAccessTokenKey) as? String
    }
}
