//
//  DataModel.swift
//  RatingModule
//
//  Created by ajay lather on 26/01/20.
//  Copyright © 2020 Ajay Lather. All rights reserved.
//

import Foundation
struct DataModel: MockResponseCodable {
    var analytics: AnalyticsModel?
    
    enum CodingKeys: String, CodingKey {
        case analytics = "analytics"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        analytics = try values.decodeIfPresent(AnalyticsModel.self, forKey: .analytics)
    }
}
