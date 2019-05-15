//
//  SBSurveyListViewController.swift
//  SurveyBeats
//
//  Created by Vikasmishra on 15/05/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import UIKit

class SBSurveyListViewController: UIViewController {
    
    /// Presenter instance
    private var presenter: SurveyListPresenter!
    
    /// To be injected in API call
    var urlSesssion: SBURLSession?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        presenter.loadSurveyList()
    }
    
    func configureViewController() {
        configurePresenter()
    }
    
    private func configurePresenter() {
        presenter =  SurveyListPresenter(urlSession: urlSesssion)
        presenter.delegate = self
    }
    
}
