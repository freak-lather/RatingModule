//
//  HeaderCell.swift
//  RatingModule
//
//  Created by ajay lather on 27/01/20.
//  Copyright © 2020 Ajay Lather. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!

    func loadData(model: AnyObject, section: Int) {
        // TODO:- Cell View model should be created
        switch section {
        case 0:
            if let model = model as? AnalyticalRating {
                title.text = model.title
                subTitle.text = model.description
            }
        default:
            if let model = model as? Job {
                title.text = model.title
                subTitle.text = model.description
            }
        }
    }
}
