//
//  RatingModel.swift
//  RatingModule
//
//  Created by ajay lather on 26/01/20.
//  Copyright © 2020 Ajay Lather. All rights reserved.
//

import Foundation
struct RatingsResponse: MockResponseCodable {
    var httpStatus: Int?
    var response: ResponseModel?
    
    enum CodingKeys: String, CodingKey {
        case httpStatus = "httpStatus"
        case response = "response"
    }
    init(httpStatus: Int = 0, response: ResponseModel? = nil) {
        self.httpStatus = httpStatus
        self.response = response
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        httpStatus = try values.decodeIfPresent(Int.self, forKey: .httpStatus)
        response = try values.decodeIfPresent(ResponseModel.self, forKey: .response)
    }
}
