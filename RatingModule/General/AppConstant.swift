//
//  AppConstant.swift
//  RatingModule
//
//  Created by ajay lather on 26/01/20.
//  Copyright © 2020 Ajay Lather. All rights reserved.
//

import Foundation
import UIKit
struct AppConstant {
    static let bundle = Bundle(for: RatingsViewController.self)
    struct Copy {
        static let jsonFileName = "data"
        static let fileType = "json"
        static let key = "response"
    }
    struct Storyboard {
        static var inbox: UIStoryboard {
            return UIStoryboard(name: "Main", bundle: bundle)
        }
    }
    struct Interface {
        static let ratingsReuseIdentifier = "RatingsViewController"
    }
    struct Assets {
        static let edit = image("filter")
    }
    static func image(_ named: String?) -> UIImage? {
        return UIImage(named: named ?? "", in: bundle, compatibleWith: nil)
    }
    struct ResponseMessage {
        static let getSuccess = "Successfully loaded ratings details"
        static let  failureNoRecordsFound = "no rating details found"
        static let unknown = "Unknown error, Try again later"
    }
    struct MockData {
        static let isEnable: Bool = false
    }
}
