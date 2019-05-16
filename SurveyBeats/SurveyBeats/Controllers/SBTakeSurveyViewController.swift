//
//  SBTakeSurveyViewController.swift
//  SurveyBeats
//
//  Created by Vikasmishra on 15/05/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import UIKit

// MARK: - Class to show details of survey
class SBTakeSurveyViewController: UIViewController {

    // MARK: - Instance variables
    /// To hold survey title injected from survey list page
    var surveyTitle: String?

    // MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = surveyTitle
    }

}
