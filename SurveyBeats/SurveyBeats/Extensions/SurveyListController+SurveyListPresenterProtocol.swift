//
//  SurveyListController+SurveyListPresenterProtocol.swift
//  SurveyBeats
//
//  Created by Vikasmishra on 15/05/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import Foundation
import UIKit

extension SurveyListViewController: SurveyListPresenterProtocol {
    func reloadViewWithSurveyItemList(_ surveyList: [SurveyType]) {
        surveyListItems = surveyList
        collectionView.reloadData()
        pageControl?.numberOfElements = surveyListItems.count
        self.collectionView.contentOffset = CGPoint(x: 0, y: 0)
    }

    func failedToLoadSurveyItemList(_ error: Error?) {
        let alert = UIAlertController(
            title: StringConstants.kEmptyString,
            message: StringConstants.kGenericErrorMessage,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: StringConstants.kOkTitleString, style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
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
