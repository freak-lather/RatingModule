//
//  AnalyticalRating.swift
//  RatingModule
//
//  Created by ajay lather on 26/01/20.
//  Copyright © 2020 Ajay Lather. All rights reserved.
//

import Foundation
struct AnalyticalRating: MockResponseCodable {
    var avg: Int?
    var description: String?
    var items: AnalyticalRatingItem?
    var title: String?
    
    enum CodingKeys: String, CodingKey {
        case avg = "avg"
        case description = "description"
        case items = "items"
        case title = "title"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        avg = try values.decodeIfPresent(Int.self, forKey: .avg)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        items = try values.decodeIfPresent(AnalyticalRatingItem.self, forKey: .items)
        title = try values.decodeIfPresent(String.self, forKey: .title)
    }
}
