//
//  ViewController.swift
//  RatingModule
//
//  Created by ajay lather on 26/01/20.
//  Copyright © 2020 Ajay Lather. All rights reserved.
//

import UIKit

class RatingsViewController: UIViewController {
    private var viewModel = RatingsListViewModel.create()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        viewModel.willRefreshScreenData()
    }

}

