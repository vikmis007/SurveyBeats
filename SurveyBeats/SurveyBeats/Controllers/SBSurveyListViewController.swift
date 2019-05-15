//
//  SBSurveyListViewController.swift
//  SurveyBeats
//
//  Created by Vikasmishra on 15/05/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import UIKit
import MBProgressHUD

let SURVEY_LIST_CELL_IDENTIFIER = "SurveyListCollectionViewCellIdentifier"
let SURVEY_LIST_CELL_NAME = "SurveyListCollectionViewCell"
let TAKE_SURVEY_IDENTIFIER = "SBTakeSurveyViewControllerIdentifier"

class SBSurveyListViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    /// Presenter instance
    private var presenter: SurveyListPresenter!
    
    /// array of model object to hold most popular articles
    lazy var surveyListItems: [SurveyType] = [SurveyType]()
    
    /// To be injected in API call
    var urlSesssion: SBURLSession?

    @IBOutlet weak var refreshBtn: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem?.isEnabled = false
        
        configureCollectionView()
        configureViewController()
        presenter.loadSurveyList()
    }
    @IBAction func refreshSurveyListTapped(_ sender: Any) {
        presenter.loadSurveyList()
    }
    
    func configureViewController() {
        configurePresenter()
    }
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: SURVEY_LIST_CELL_NAME, bundle: nil), forCellWithReuseIdentifier: SURVEY_LIST_CELL_IDENTIFIER)
    }
    
    private func configurePresenter() {
        presenter =  SurveyListPresenter(urlSession: urlSesssion)
        presenter.delegate = self
    }
    
    /// Method to show loading indicator.
    func showLoadingIndicator() {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.mode = MBProgressHUDMode.indeterminate
        hud.isUserInteractionEnabled = false
    }
    
    /// Method to hide loading indicator.
    func hideLoadingIndicator() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
}
