//
//  AnalyticalRating.swift
//  RatingModule
//
//  Created by ajay lather on 26/01/20.
//  Copyright © 2020 Ajay Lather. All rights reserved.
//

import Foundation
struct AnalyticalRating: MockResponseCodable {
    var avg: Double?
    var description: String?
    var items: AnalyticalRatingItem?
    var title: String?
    
    enum CodingKeys: String, CodingKey {
        case avg = "avg"
        case description = "description"
        case items = "items"
        case title = "title"
    }
    init(avg: Double = 0, description: String = "", items: AnalyticalRatingItem? = nil, title: String = "") {
        self.avg = avg
        self.description = description
        self.items = items
        self.title = title
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        avg = try values.decodeIfPresent(Double.self, forKey: .avg)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        items = try values.decodeIfPresent(AnalyticalRatingItem.self, forKey: .items)
        title = try values.decodeIfPresent(String.self, forKey: .title)
    }
}
