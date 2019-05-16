//
//  SurveyListService.swift
//  SurveyBeats
//
//  Created by Vikasmishra on 14/05/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import UIKit

enum SurveyListFeedResult {
    /// For successful fetching of feed.`
    case success(surveyListData: [SurveyType])

    /// For error while fetching of feed.
    /// - error: Error that occurred.
    case error(error: Error)

    /// For invalid endpoint URL
    case invalidURL

    /// For unknown error
    case unknownError
}

typealias SurveyListFeedCompletionHandler = (_ result: SurveyListFeedResult) -> Void

class SurveyListService: NSObject {
    /// API url component instance
    private var urlComponents: URLComponents!

    /// URLSession to be injected
    private var urlSession: SBURLSession?

    /// Convenience Initializer
    convenience init(urlSession: SBURLSession?) {
        self.init()
        self.urlSession = urlSession
    }

    /// Designated Initializer
    override init() {
        urlComponents = URLComponents(string: SBStringConstants.kEndPoint)!
        urlComponents.queryItems = [
            URLQueryItem(
                name: SBStringConstants.kAccessTokenKey, value: ""
            )
        ]
    }

    private func fetchSurveyFeedWith(token: String, completion: @escaping SurveyListFeedCompletionHandler) {

        self.urlComponents.queryItems = [
            URLQueryItem(
                name: SBStringConstants.kAccessTokenKey, value: token
            )
        ]

        if let feedURL = self.urlComponents.url {

            NetworkEngine(urlSession: self.urlSession).get(url: feedURL, completion: { (data, error) in

                if error != nil {
                    completion(SurveyListFeedResult.error(error: error!))
                    return
                }

                do {
                    if let data = data {
                        let decoder = JSONDecoder()
                        let surveyFeedList = try decoder.decode([SurveyType].self, from: data)
                        completion(SurveyListFeedResult.success(surveyListData: surveyFeedList))
                    }
                } catch {
                    completion(SurveyListFeedResult.error(error: error))
                }
            })
        } else {
            completion(SurveyListFeedResult.invalidURL)
        }

    }

    /// Fetch survey feed from API endpoint
    ///
    /// - Parameter completion: Completion handler to pass data
    public func fetchSurveyFeed(completion: @escaping SurveyListFeedCompletionHandler) {

        urlComponents.path = SBStringConstants.kSurveyListAPIPath

        var accessToken: String? = SBUtil.getAccessToken()

        if accessToken == nil {
            let authService = OAuthTokenService()
            authService.getAccessToken { (token) in
                accessToken = token

                if accessToken == nil {
                    completion(SurveyListFeedResult.unknownError)
                } else {
                    self.fetchSurveyFeedWith(token: accessToken!, completion: completion)
                }

            }
        } else {
            fetchSurveyFeedWith(token: accessToken!, completion: completion)
        }
    }
}
