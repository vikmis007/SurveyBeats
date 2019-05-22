//
//  StringConstants.swift
//  SurveyBeats
//
//  Created by Vikasmishra on 14/05/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import Foundation

struct StringConstants {

    // API endpoint url
    static let kEndPoint = "https://nimble-survey-api.herokuapp.com"

    // API path url
    static let kSurveyListAPIPath = "/surveys.json"
    static let kTokenAPIPath = "/oauth/token"

    // Query params keys to be passed in API request
    static let kAccessTokenKey = "access_token"

    // Body params keys to be passed in API request
    static let kUserNameKey = "username"
    static let kPasswordKey = "password"
    static let kGrantTypeKey = "grant_type"

    // Body params keys to be passed in API request
    static let kUserNameValue = "carlos@nimbl3.com"
    static let kPasswordValue = "antikera"
    static let kGrantTypeValue = "password"

    // HTTP methods constant
    static let kHTTPMethodPost = "POST"
    static let kHTTPMethodGet = "GET"

    // Generic string constants
    static let kEmptyString = ""
    static let kOkTitleString = "OK"
    static let kGenericErrorMessage = "Something went wrong. Please try again !!"
}
