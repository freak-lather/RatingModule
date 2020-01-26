//
//  Job.swift
//  RatingModule
//
//  Created by ajay lather on 26/01/20.
//  Copyright © 2020 Ajay Lather. All rights reserved.
//

import Foundation
struct Job: MockResponseCodable {
    var description: String?
    var title: String?
    var items: [JobItem]?
    
    enum CodingKeys: String, CodingKey {
        case description = "description"
        case title = "title"
        case items = "items"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        items = try values.decodeIfPresent([JobItem].self, forKey: .items)
    }
}
