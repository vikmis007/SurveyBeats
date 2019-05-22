//
//  OAuthTokenService.swift
//  SurveyBeats
//
//  Created by Vikasmishra on 14/05/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import UIKit

// MARK: - Service Class to maintain OAuth Token
class OAuthTokenService {

    /// OAuth API url component instance
    private var urlComponents: URLComponents

    /// Initializer method
    init() {
        urlComponents = URLComponents(string: StringConstants.kEndPoint)!
        urlComponents.path = StringConstants.kTokenAPIPath
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
            StringConstants.kUserNameKey: StringConstants.kUserNameValue,
            StringConstants.kPasswordKey: StringConstants.kPasswordValue,
            StringConstants.kGrantTypeKey: StringConstants.kGrantTypeValue
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
                    let token = json["access_token"] as? String {
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
