//
//  AnalyticalRatingItem.swift
//  RatingModule
//
//  Created by ajay lather on 26/01/20.
//  Copyright © 2020 Ajay Lather. All rights reserved.
//

import Foundation
struct AnalyticalRatingItem: MockResponseCodable {
    var description: String?
    var one: Int?
    var two: Int?
    var three: Int?
    var four: Int?
    var five: Int?
    
    enum CodingKeys: Int, CodingKey {
        case one = 1
        case two = 2
        case three = 3
        case four = 4
        case five = 5
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        one = try values.decodeIfPresent(Int.self, forKey: .one)
        two = try values.decodeIfPresent(Int.self, forKey: .two)
        three = try values.decodeIfPresent(Int.self, forKey: .three)
        four = try values.decodeIfPresent(Int.self, forKey: .four)
        five = try values.decodeIfPresent(Int.self, forKey: .five)
    }
}
