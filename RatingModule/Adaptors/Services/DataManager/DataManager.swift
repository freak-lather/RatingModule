//
//  DataManager.swift
//  RatingModule
//
//  Created by ajay lather on 26/01/20.
//  Copyright © 2020 Ajay Lather. All rights reserved.
//

import Foundation
class DataManager {
    static let sharedInstance = DataManager()
    func getRatingsDetails()-> RatingsResponse? {
        return RatingsResponse.getObjectFromJSONFile(fileName: AppConstant.Copy.jsonFileName, forKey: nil, fileType: AppConstant.Copy.fileType)
    }
}
