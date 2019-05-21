//
//  SurveyListController+SurveyListCollectionViewCellProtocol.swift
//  SurveyBeats
//
//  Created by Vikasmishra on 15/05/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import Foundation

extension SurveyListViewController: SurveyListCollectionViewCellProtocol {
    func didTapTakeSurveyWithTitle(_ title: String) {
        guard let takeSurveyViewController: TakeSurveyViewController =
            storyboard?.instantiateViewController(withIdentifier: takeSurveyControllerIdentifier)
                as? TakeSurveyViewController else { return }
        takeSurveyViewController.surveyTitle = title
        self.navigationController?.show(takeSurveyViewController, sender: nil)
    }
}
