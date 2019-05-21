//
//  Util.swift
//  SurveyBeats
//
//  Created by Vikasmishra on 14/05/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

// MARK: - Utility class
class Util {

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

    /// This method will set access token in Keychain
    ///
    /// - Parameter token: token to be saved
    static func setAccessToken(token: String?) {
        guard let _ = token else { return }
        KeychainWrapper.standard.set(token!, forKey: StringConstants.kAccessTokenKey)
    }

    /// This method will get access token from Keychain
    ///
    /// - Returns: token string
    static func getAccessToken() -> String? {
        return KeychainWrapper.standard.string(forKey: StringConstants.kAccessTokenKey)
    }
}
