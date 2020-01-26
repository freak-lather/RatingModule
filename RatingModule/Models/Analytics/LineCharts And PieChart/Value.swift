//
//  Value.swift
//  RatingModule
//
//  Created by ajay lather on 26/01/20.
//  Copyright © 2020 Ajay Lather. All rights reserved.
//

import Foundation
struct Value: MockResponseCodable {
    var key: String?
    var value: Int?
    
    enum CodingKeys: String, CodingKey {
        case key = "key"
        case value = "value"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        key = try values.decodeIfPresent(String.self, forKey: .key)
        value = try values.decodeIfPresent(Int.self, forKey: .value)
    }
}
