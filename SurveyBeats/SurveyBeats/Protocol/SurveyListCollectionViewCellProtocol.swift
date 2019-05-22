//
//  SurveyListCollectionViewCellProtocol.swift
//  SurveyBeats
//
//  Created by Vikasmishra on 15/05/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import Foundation

// MARK: - Protocol for Survey list table view cell
protocol SurveyListCollectionViewCellProtocol: class {

    /// To notify controller that take survey has been triggered
    ///
    /// - Parameter title: title of the survey
    func didTapTakeSurveyWithTitle(_ title: String)
}
