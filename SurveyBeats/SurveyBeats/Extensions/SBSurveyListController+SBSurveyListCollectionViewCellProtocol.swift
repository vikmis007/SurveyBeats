//
//  SurveyListController+SurveyListCollectionViewCellProtocol.swift
//  SurveyBeats
//
//  Created by Vikasmishra on 15/05/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import Foundation

extension SBSurveyListViewController: SBSurveyListCollectionViewCellProtocol {
    func didTapTakeSurveyWith(title: String) {
        guard let takeSurveyViewController: SBTakeSurveyViewController =
            storyboard?.instantiateViewController(withIdentifier: takeSurveyControllerIdentifier)
                as? SBTakeSurveyViewController else { return }
        takeSurveyViewController.surveyTitle = title
        self.navigationController?.show(takeSurveyViewController, sender: nil)
    }
}
