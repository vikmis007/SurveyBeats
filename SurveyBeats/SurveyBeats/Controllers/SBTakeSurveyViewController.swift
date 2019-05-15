//
//  SBTakeSurveyViewController.swift
//  SurveyBeats
//
//  Created by Vikasmishra on 15/05/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import UIKit

class SBTakeSurveyViewController: UIViewController {
    
    var surveyTitle: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = surveyTitle
    }

}
