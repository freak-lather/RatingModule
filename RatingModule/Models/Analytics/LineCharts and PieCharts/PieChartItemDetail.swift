//
//  PieChartItem.swift
//  RatingModule
//
//  Created by ajay lather on 27/01/20.
//  Copyright © 2020 Ajay Lather. All rights reserved.
//

import Foundation
struct PieChartsItemDetail: MockResponseCodable {
    var key: String?
    var value: Double?
    
    enum CodingKeys: String, CodingKey {
        case key = "key"
        case value = "value"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        key = try values.decodeIfPresent(String.self, forKey: .key)
        value = try values.decodeIfPresent(Double.self, forKey: .value)
    }
}
