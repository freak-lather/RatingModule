//
//  ItemDetail.swift
//  RatingModule
//
//  Created by ajay lather on 26/01/20.
//  Copyright © 2020 Ajay Lather. All rights reserved.
//

import Foundation
struct JobItem: MockResponseCodable {
    var description: String?
    var growth: Int?

    var title: String?
    var total: Int?
    
    enum CodingKeys: String, CodingKey {
        case description = "description"
        case growth = "growth"
        case title = "title"
        case total = "total"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        growth = try values.decodeIfPresent(Int.self, forKey: .growth)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        total = try values.decodeIfPresent(Int.self, forKey: .total)
    }
}
