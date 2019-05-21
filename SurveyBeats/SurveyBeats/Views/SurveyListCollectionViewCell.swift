//
//  SurveyListCollectionViewCell.swift
//  SurveyBeats
//
//  Created by Vikasmishra on 15/05/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import UIKit
import SDWebImage

// MARK: - Survey list collection view cell class
class SurveyListCollectionViewCell: UICollectionViewCell {

    // MARK: - IBOutlets here
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var takeSurveyBtn: UIButton!

    // MARK: - Instance variables here
    /// Cell protocol delegate property
    weak var delegate: SurveyListCollectionViewCellProtocol!

    // MARK: - Life cycle mthods
    override func awakeFromNib() {
        super.awakeFromNib()
        takeSurveyBtn.clipsToBounds = true
        takeSurveyBtn.layer.cornerRadius = takeSurveyBtn.bounds.height / 2
    }

    override func prepareForReuse() {
        coverImage.image = nil
    }

    // MARK: - IBActions here
    @IBAction func takeSurveyButtonTapped(_ sender: Any) {
        delegate.didTapTakeSurveyWith(title: titleLabel.text ?? "")
    }

    // MARK: - Helper methods
    /// This method will update cell data based on model object
    ///
    /// - Parameter survey: SurveyType model object
    func updateCellRecordWith(survey: SurveyType) {
        titleLabel.text = survey.title
        descriptionLabel.text = survey.description
        if let urlString = survey.coverImageUrl {
            let highResolutionURLString = "\(urlString)l"
            if let url = URL(string: highResolutionURLString) {
                coverImage.sd_setImage(with: url, completed: nil)
            }
        }
    }
}
