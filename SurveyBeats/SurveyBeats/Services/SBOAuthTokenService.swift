//
//  OAuthTokenService.swift
//  SurveyBeats
//
//  Created by Vikasmishra on 14/05/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import UIKit

// MARK: - Service Class to maintain OAuth Token
class SBOAuthTokenService: NSObject {

    /// OAuth API url component instance
    private var urlComponents: URLComponents!

    /// Initializer method
    override init() {
        urlComponents = URLComponents(string: SBStringConstants.kEndPoint)!
        urlComponents.path = SBStringConstants.kTokenAPIPath
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
        tokenRequest.httpMethod = SBStringConstants.kHTTPMethodPost

        let postParam = [
            SBStringConstants.kUserNameKey: SBStringConstants.kUserNameValue,
            SBStringConstants.kPasswordKey: SBStringConstants.kPasswordValue,
            SBStringConstants.kGrantTypeKey: SBStringConstants.kGrantTypeValue
        ]

        let postString = SBUtil.getPostRequestStringForFormData(params: postParam)
        tokenRequest.httpBody = postString.data(using: .utf8)

        SBNetworkEngine(urlSession: nil).post(request: tokenRequest) { (data, error) in
            if error != nil {
                completion(nil)
            }
            do {
                if let data = data,
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                    let token = json["access_token"] as? String {
                    SBUtil.setAccessToken(token: token)
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
