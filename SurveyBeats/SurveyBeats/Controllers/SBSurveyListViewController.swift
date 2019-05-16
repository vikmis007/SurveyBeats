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

let surveyListCellIdentifier = "SurveyListCollectionViewCellIdentifier"
let surveyListCellName = "SurveyListCollectionViewCell"
let takeSurveyControllerIdentifier = "SBTakeSurveyViewControllerIdentifier"

class SBSurveyListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    /// Presenter instance
    private var presenter: SurveyListPresenter!

    /// array of model object to hold most popular articles
    lazy var surveyListItems: [SurveyType] = [SurveyType]()

    /// To be injected in API call
    var urlSesssion: SBURLSession?

    var pageControl: CMPageControl?

    /// to catch any error generated in service calls
    var error: Error?

    @IBOutlet weak var refreshBtn: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem?.isEnabled = false

        initialSetup()

    }
    @IBAction func refreshSurveyListTapped(_ sender: Any) {
        presenter.loadSurveyList()
    }

    func configurePageControl() {
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

    func initialSetup() {
        configurePageControl()
        configurePresenter()
        configureCollectionView()
        presenter.loadSurveyList()
    }

    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(
            UINib(nibName: surveyListCellName, bundle: nil),
            forCellWithReuseIdentifier: surveyListCellIdentifier
        )
    }

    private func configurePresenter() {
        presenter =  SurveyListPresenter(urlSession: urlSesssion)
        presenter.delegate = self
    }

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
