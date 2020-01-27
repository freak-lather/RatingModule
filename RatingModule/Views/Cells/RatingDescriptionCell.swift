//
//  RatingDescriptionCell.swift
//  RatingModule
//
//  Created by ajay lather on 27/01/20.
//  Copyright © 2020 Ajay Lather. All rights reserved.
//

import UIKit

class RatingDescriptionCell: UITableViewCell {
    @IBOutlet weak var avgLabel: UILabel!
    @IBOutlet weak var totalRating: UILabel!
    @IBOutlet weak var totalStar: UILabel!
    @IBOutlet weak var oneStar: UILabel!
    @IBOutlet weak var twoStar: UILabel!
    @IBOutlet weak var threeStar: UILabel!
    @IBOutlet weak var fourStar: UILabel!
    @IBOutlet weak var fiveStar: UILabel!
    
    func loadData(model: AnalyticalRating) {
        // TODO:- cell view model should be created
        if let avg = model.avg {
            avgLabel.text = String(Double(avg))
        }
        totalStar.text = String("Out of 5")
        if let item = model.items, let one = item.one, let two = item.two, let three = item.three, let four = item.four, let five = item.five  {
            let count = one + two + three + four + five
            totalRating.text = "Total ratings " + String(Double(count))
        }
    }
}
