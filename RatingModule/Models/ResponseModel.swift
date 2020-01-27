//
//  RatingResponseModel.swift
//  RatingModule
//
//  Created by ajay lather on 26/01/20.
//  Copyright © 2020 Ajay Lather. All rights reserved.
//

import Foundation
struct ResponseModel: MockResponseCodable {
    var message: String?
    var data: DataModel?
    
    enum CodingKeys: String, CodingKey {
        case message = "message"
        case data = "data"
    }
    
    init(message: String = "", data: DataModel? = nil) {
        self.message = message
        self.data = data
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(DataModel.self, forKey: .data)
    }
}
