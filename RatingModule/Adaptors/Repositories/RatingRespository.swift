//
//  RatingRespository.swift
//  RatingModule
//
//  Created by ajay lather on 26/01/20.
//  Copyright © 2020 Ajay Lather. All rights reserved.
//

import Foundation
protocol RatingsRepositoryProtocol {
    func getRatingsDetails(query: String, handler:@escaping (RatingsResponse?, String?)-> Void)-> Void
}

struct RatingsRepository: RatingsRepositoryProtocol {
    func getRatingsDetails(query: String, handler:@escaping (RatingsResponse?, String?)-> Void) -> Void {
        if let response = DataManager.sharedInstance.requetRatingData(query) {
            handler(response, AppConstant.ResponseMessage.getSuccess)
        } else {
            handler(nil, AppConstant.ResponseMessage.failureNoRecordsFound)
        }
    }
}
