//
//  OAuthTokenService.swift
//  SurveyBeats
//
//  Created by Vikasmishra on 14/05/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import UIKit

// MARK: - Constants related to OAuthTokenService class
// Token API path
let kTokenAPIPath = "/oauth/token"

// Body params keys to be passed in API request
let kUserNameKey = "username"
let kPasswordKey = "password"
let kGrantTypeKey = "grant_type"

// Body params values to be passed in API request
let kUserNameValue = "carlos@nimbl3.com"
let kPasswordValue = "antikera"
let kGrantTypeValue = "password"

// MARK: - Service Class to maintain OAuth Token
class OAuthTokenService {

    /// OAuth API url component instance
    private var urlComponents: URLComponents

    /// Initializer method
    init() {
        urlComponents = URLComponents(string: StringConstants.kEndPoint)!
        urlComponents.path = kTokenAPIPath
    }

    /// This method will request access token using get request
    ///
    /// - Parameter completion: request completion block
    public func getAccessToken(completion: @escaping (String?) -> Void) {
        guard let url = urlComponents.url else {
            completion(nil)
            return
        }
        var tokenRequest = URLRequest(url: url)
        tokenRequest.httpMethod = StringConstants.kHTTPMethodPost

        let postParam = [
            kUserNameKey: kUserNameValue,
            kPasswordKey: kPasswordValue,
            kGrantTypeKey: kGrantTypeValue
        ]

        let postString = Util.getPostRequestStringForFormData(params: postParam)
        tokenRequest.httpBody = postString.data(using: .utf8)

        NetworkEngine(urlSession: nil).post(request: tokenRequest) { (data, error) in
            if error != nil {
                completion(nil)
            }
            do {
                if let data = data,
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                    let token = json[StringConstants.kAccessTokenKey] as? String {
                    Util.setAccessToken(token: token)
                    completion(token)
                } else {
                    completion(nil)
                }
            } catch {
                completion(nil)
            }
        }
    }
}
