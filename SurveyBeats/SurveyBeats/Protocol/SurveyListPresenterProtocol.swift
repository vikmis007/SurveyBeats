//
//  SurveyListPresenterProtocol.swift
//  SurveyBeats
//
//  Created by Vikasmishra on 15/05/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import Foundation

protocol SurveyListPresenterProtocol: class {
    /// To reload view with new data on API success
    ///
    /// - Parameter forecastList: array of forecast model data
    func reloadViewWithSurveyItemList(_ surveyList: [SurveyType])
    
    /// To show error when API request fails
    ///
    /// - Parameter error: error received
    func failedToLoadSurveyItemList(_ error: Error?)
    
    /// Toggle loading indicator on API request
    ///
    /// - Parameter shouldShow: show/hide loading indicator
    func showLoadingIndicator(_ shouldShow: Bool)
}
