//
//  PieChartItems.swift
//  RatingModule
//
//  Created by ajay lather on 27/01/20.
//  Copyright © 2020 Ajay Lather. All rights reserved.
//

import Foundation
struct PieChartsItems: MockResponseCodable {
    var chartType: String?
    var description: String?
    var items: [PieChartsItemDetail]?
    var title: String?
    
    enum CodingKeys: String, CodingKey {
        case chartType = "chartType"
        case description = "description"
        case items = "items"
        case title = "title"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        chartType = try values.decodeIfPresent(String.self, forKey: .chartType)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        items = try values.decodeIfPresent([PieChartsItemDetail].self, forKey: .items)
        title = try values.decodeIfPresent(String.self, forKey: .title)
    }
}
