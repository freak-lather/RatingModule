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
        let networkManager = NetworkManager()
        networkManager.getRatings(query: query, completion: { (response, error) in
            if let response = response {
               handler(response, AppConstant.ResponseMessage.getSuccess)
               return
            }
            handler(nil, AppConstant.ResponseMessage.failureNoRecordsFound)
        })
    }
}
