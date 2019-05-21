//
//  SurveyType.swift
//  SurveyBeats
//
//  Created by Vikasmishra on 14/05/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import Foundation

struct SurveyType: Decodable {
    /// Title of the survey
    let title: String?

    /// Description of the survey
    let description: String?

    /// Cover image URL of the survey
    let coverImageUrl: String?

    private enum CodingKeys: String, CodingKey {
        case title

        case description

        case coverImageUrl = "cover_image_url"
    }

    /// Init method to decode into model object
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        coverImageUrl = try container.decodeIfPresent(String.self, forKey: .coverImageUrl)
    }
}
