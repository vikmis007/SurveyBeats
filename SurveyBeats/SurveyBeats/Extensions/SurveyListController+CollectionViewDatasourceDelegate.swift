//
//  SurveyListController+CollectionViewDatasourceDelegate.swift
//  SurveyBeats
//
//  Created by Vikasmishra on 15/05/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import UIKit

extension SBSurveyListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return surveyListItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: SurveyListCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: SURVEY_LIST_CELL_IDENTIFIER, for: indexPath) as? SurveyListCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.updateCellRecordWith(survey: surveyListItems[indexPath.row])
        cell.delegate = self
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.bounds.width, height: self.collectionView.bounds.height)
    }
}
