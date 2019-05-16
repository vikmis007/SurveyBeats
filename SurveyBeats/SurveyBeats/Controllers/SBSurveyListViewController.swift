//
//  SBSurveyListViewController.swift
//  SurveyBeats
//
//  Created by Vikasmishra on 15/05/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import UIKit
import MBProgressHUD
import CMPageControl

// MARK: - XIB Identifiers
let surveyListCellIdentifier = "SurveyListCollectionViewCellIdentifier"
let surveyListCellName = "SurveyListCollectionViewCell"
let takeSurveyControllerIdentifier = "SBTakeSurveyViewControllerIdentifier"

// MARK: - Class to show list of surveys
class SBSurveyListViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var refreshBtn: UIBarButtonItem!

    // MARK: - Instance variables
    /// Presenter instance
    private var presenter: SurveyListPresenter!

    /// array of model object to hold survey list
    lazy var surveyListItems: [SurveyType] = [SurveyType]()

    /// To be injected in API call
    var urlSesssion: SBURLSession?

    /// To show page control in sync with collection view
    var pageControl: CMPageControl?

    /// to catch any error generated in service calls
    var error: Error?

    // MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem?.isEnabled = false
        initialSetup()
    }

    // MARK: - IBActions here
    @IBAction func refreshSurveyListTapped(_ sender: Any) {
        presenter.loadSurveyList()
    }

    // MARK: - Helper methods
    /// This method will initially configure presenter, collection view and load survey list from API
    func initialSetup() {
        configurePageControl()
        configurePresenter()
        configureCollectionView()
        presenter.loadSurveyList()
    }

    /// To configure page control's UI and bounds
    private func configurePageControl() {
        pageControl = CMPageControl(
            frame: CGRect(
                x: view.bounds.size.width - 20,
                y: 10,
                width: 30,
                height: view.bounds.size.height - 20
            )
        )
        pageControl?.elementBackgroundColor = UIColor.clear
        pageControl?.isUserInteractionEnabled = false
        pageControl?.numberOfElements = 0
        pageControl?.elementWidth = 10.0
        pageControl?.elementBorderWidth = 1.0
        pageControl?.elementBorderColor = UIColor.white
        pageControl?.elementSelectedBorderWidth = 0.0
        pageControl?.elementSelectedBackgroundColor = UIColor.white
        pageControl?.elementCornerRadius = 5
        pageControl?.orientation = .Vertical
        view.addSubview(self.pageControl!)
    }

    /// To configure collections and set delegate
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(
            UINib(nibName: surveyListCellName, bundle: nil),
            forCellWithReuseIdentifier: surveyListCellIdentifier
        )
    }

    /// To configure presenter
    private func configurePresenter() {
        presenter =  SurveyListPresenter(urlSession: urlSesssion)
        presenter.delegate = self
    }

    /// This method will update page indicator based on index
    ///
    /// - Parameter index: index to be updated
    func updatePageControlCurrentIndex(_ index: Int) {
        pageControl?.currentIndex = index
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
