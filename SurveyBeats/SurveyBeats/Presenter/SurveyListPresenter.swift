//
//  SurveyListPresenter.swift
//  SurveyBeats
//
//  Created by Vikasmishra on 15/05/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import UIKit


class SurveyListPresenter: NSObject {
    private var surveyListService: SurveyListService?
    
    /// Delegate property for ForecastListPresenterProtocol
    weak var delegate: SurveyListPresenterProtocol?
    
    /// convenience initilizer
    convenience init(urlSession: SBURLSession?) {
        self.init()
        surveyListService = SurveyListService(urlSession: urlSession)
    }
    
    
    /// Method to load data from API endpoint
    func loadSurveyList() {
        delegate?.showLoadingIndicator(true)
        
        surveyListService?.fetchSurveyFeed(completion: { [weak self] (surveyListItem) in
            DispatchQueue.main.async {
                self?.delegate?.showLoadingIndicator(false)
            }
            
            switch surveyListItem {
            case .success(let surveyFeedList):
                DispatchQueue.main.async {
                    self?.delegate?.reloadViewWithSurveyItemList(surveyFeedList)
                }
            case .invalidURL, .unknownError:
                DispatchQueue.main.async {
                    self?.delegate?.failedToLoadSurveyItemList(nil)
                }
            case .error(let error):
                DispatchQueue.main.async {
                    self?.delegate?.failedToLoadSurveyItemList(error)
                }
            }
        })
    }
}
