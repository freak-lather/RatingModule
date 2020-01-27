//
//  RatingsViewModel.swift
//  RatingModule
//
//  Created by ajay lather on 26/01/20.
//  Copyright © 2020 Ajay Lather. All rights reserved.
//

import UIKit
protocol RatingListViewModelProtocol {
    func didLoad()
    func willRefreshScreenData()
}

class RatingsListViewModel {
    var response: RatingsResponse?
    var reload: (()-> Void) = {}
    private var interactor: DisplayRatingDetailProtocol
    
    init(with interactor:DisplayRatingDetailProtocol) {
        self.interactor = interactor
    }
}

extension RatingsListViewModel: RatingListViewModelProtocol {
    static func create()-> RatingsListViewModel {
        let repository =  RatingsRepository()
        let interactor: DisplayRatingDetail = DisplayRatingDetail(with: repository)
        return RatingsListViewModel(with: interactor)
    }
    
    func didLoad() {
        self.interactor.fetchDetails { (response, message) in
            print(response)
            self.reload()
        }
    }
    
    func numberOfRows() -> Int {
        return 0
    }
    
    @objc func willRefreshScreenData() {
        didLoad()
    }
}

