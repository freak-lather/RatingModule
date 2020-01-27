//
//  RatingRespository.swift
//  RatingModule
//
//  Created by ajay lather on 26/01/20.
//  Copyright © 2020 Ajay Lather. All rights reserved.
//

import Foundation
protocol RatingsRepositoryProtocol {
    func getRatingsDetails(_ handler:@escaping (_ response: RatingsResponse?, _ message: String?)->Void)-> Void
}

struct RatingsRepository: RatingsRepositoryProtocol {
    func getRatingsDetails(_ handler:@escaping (_ response: RatingsResponse?, _ message: String?)->Void) -> Void {
        if let response = DataManager.sharedInstance.getRatingsDetails() {
            handler(response, AppConstant.ResponseMessage.getSuccess)
        } else {
            handler(nil, AppConstant.ResponseMessage.failureNoRecordsFound)
        }
    }
}
