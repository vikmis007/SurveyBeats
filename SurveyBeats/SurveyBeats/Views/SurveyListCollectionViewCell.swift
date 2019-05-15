//
//  SurveyListCollectionViewCell.swift
//  SurveyBeats
//
//  Created by Vikasmishra on 15/05/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import UIKit
import SDWebImage

class SurveyListCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var coverImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var takeSurveyBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        takeSurveyBtn.clipsToBounds = true
        takeSurveyBtn.layer.cornerRadius = takeSurveyBtn.bounds.height / 2
    }
    
    override func prepareForReuse() {
        coverImage.image = nil
    }
    
    func updateCellRecordWith(survey: SurveyType) {
        titleLabel.text = survey.title
        descriptionLabel.text = survey.description
        if let urlString = survey.coverImageUrl,
            let url = URL(string: urlString){
            coverImage.sd_setImage(with: url, completed: nil)
        }
    }

    @IBAction func takeSurveyButtonTapped(_ sender: Any) {
    }
}
