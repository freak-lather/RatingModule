//
//  RatingsDetails.swift
//  RatingModule
//
//  Created by ajay lather on 26/01/20.
//  Copyright © 2020 Ajay Lather. All rights reserved.
//

import Foundation
protocol DisplayRatingDetailProtocol {
    func fetchDetails(query: String, handler:@escaping (RatingsResponse?, String?)-> Void)->Void
}

struct DisplayRatingDetail {
    private var repository: RatingsRepositoryProtocol
    init(with repository: RatingsRepositoryProtocol) {
        self.repository = repository
    }
}

extension DisplayRatingDetail: DisplayRatingDetailProtocol {
    func fetchDetails(query: String, handler:@escaping (RatingsResponse?, String?)-> Void) -> Void {
        repository.getRatingsDetails(query: query) { response, message in
            handler(response, message)
        }
    }
}
