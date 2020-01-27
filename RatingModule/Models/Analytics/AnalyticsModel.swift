//
//  Analytics.swift
//  RatingModule
//
//  Created by ajay lather on 26/01/20.
//  Copyright © 2020 Ajay Lather. All rights reserved.
//

import Foundation
typealias ChartArray = [ChartsItems]
struct AnalyticsModel: MockResponseCodable {
    var job: Job?
    var lineCharts: [ChartArray]?
    var pieCharts: [PieChartsItems]?
    var rating: AnalyticalRating?
    var service: Job?
    
    enum CodingKeys: String, CodingKey {
        case job = "job"
        case rating = "rating"
        case lineCharts = "lineCharts"
        case pieCharts = "pieCharts"
        case service = "service"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        job = try values.decodeIfPresent(Job.self, forKey: .job)
        lineCharts = try values.decodeIfPresent([ChartArray].self, forKey: .lineCharts)
        rating = try values.decodeIfPresent(AnalyticalRating.self, forKey: .rating)
        service = try values.decodeIfPresent(Job.self, forKey: .service)
        pieCharts = try values.decodeIfPresent([PieChartsItems].self, forKey: .pieCharts)
    }
}
