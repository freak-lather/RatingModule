//
//  CommonCell.swift
//  RatingModule
//
//  Created by ajay lather on 27/01/20.
//  Copyright © 2020 Ajay Lather. All rights reserved.
//

import UIKit

class CommonCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var arrow: UILabel!
    @IBOutlet weak var percentage: UILabel!
    
    func loadData(model: JobItem) {
        title.text = model.title
        subTitle.text = model.description
        arrow.text = "^|"
        percentage.text = String(Double(model.growth!))
    }
    
}
