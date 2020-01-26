//
//  Analytics.swift
//  RatingModule
//
//  Created by ajay lather on 26/01/20.
//  Copyright © 2020 Ajay Lather. All rights reserved.
//

import Foundation
struct AnalyticsModel: MockResponseCodable {
    var job: Job?
    var lineCharts: [AnyObject]?
    var piCharts: [AnyObject]?
    var rating: AnalyticalRating?
    var service: Job?
    
    enum CodingKeys: String, CodingKey {
        case job = "job"
        case rating = "rating"
        case service = "service"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        job = try values.decodeIfPresent(Job.self, forKey: .job)
        rating = try values.decodeIfPresent(AnalyticalRating.self, forKey: .rating)
        service = try values.decodeIfPresent(Job.self, forKey: .service)
    }
}
