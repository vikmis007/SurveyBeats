//
//  NetworkEngine.swift
//  SurveyBeats
//
//  Created by Vikasmishra on 14/05/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import Foundation

/// Typealias to completetion handler, will be used in API requests
typealias NetworkEngineCompletionHandler = (_ data: Data?, _ error: Error?) -> Void

/// This is a factory class to handle API calls
final class SBNetworkEngine: NSObject {

    /// To create a url session for API call
    private var urlSession: SBURLSession!

    /// To initialise network engine with url session
    ///
    /// - Parameter urlSession: urlsession used for initialisation
    init(urlSession: SBURLSession?) {
        self.urlSession = urlSession ?? URLSession.shared
    }

    /// To execute get request
    ///
    /// - Parameters:
    ///   - url: url for the get request
    ///   - completion: completion handler to process response/error received from the get request
    public func get(url: URL, completion: @escaping NetworkEngineCompletionHandler) {
        urlSession.dataTask(with: url) { data, _, error in
            completion(data, error)
            }.resume()
    }

    /// To execute post request
    ///
    /// - Parameters:
    ///   - urlRequest: url request for the post request
    ///   - completion: completion handler to process response/error received from the post request
    public func post(request: URLRequest, completion: @escaping NetworkEngineCompletionHandler) {
        urlSession.dataTask(with: request) { (data, _, error) in
            completion(data, error)
        }.resume()
    }
}
