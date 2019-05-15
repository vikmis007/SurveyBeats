//
//  SurveyListController+SurveyListPresenterProtocol.swift
//  SurveyBeats
//
//  Created by Vikasmishra on 15/05/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import Foundation

extension SBSurveyListViewController: SurveyListPresenterProtocol {
    func reloadViewWithSurveyItemList(_ surveyList: [SurveyType]) {
        surveyListItems = surveyList
        collectionView.reloadData()
    }
    
    func failedToLoadSurveyItemList(_ error: Error?) {
        
    }
    
    func showLoadingIndicator(_ shouldShow: Bool) {
        if shouldShow {
            showLoadingIndicator()
            navigationItem.leftBarButtonItem?.isEnabled = false
        } else {
            hideLoadingIndicator()
            navigationItem.leftBarButtonItem?.isEnabled = true
        }
    }
}
