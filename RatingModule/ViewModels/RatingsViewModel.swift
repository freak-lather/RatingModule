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
    func numberOfRows(index: Int) -> Int
    func numberOfSection() -> Int
    
}

class RatingsListViewModel {
    var jobs = [JobItem]()
    var jobItem: Job?
    var ratingsDetails: AnalyticalRating?
    var queryType: QueryType = .LAST_7_DAYS
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
        self.interactor.fetchDetails(query: self.queryType.type) { [weak self] (response, message) in
            if let response = response, let analytics = response.response?.data?.analytics {
                if let job = analytics.job, let jobList = job.items  {
                    self?.jobItem = job
                    self?.jobs = jobList
                }
                if let ratings = analytics.rating {
                    self?.ratingsDetails = ratings
                }
            }
            self?.reload()
        }
    }
    
    func numberOfRows(index: Int) -> Int {
        switch index {
        case 0:
            return 1
        case 1:
            return self.jobs.count
        default:
            return 0
        }
    }
    func numberOfSection() -> Int {
        return 2
    }
    
    @objc func willRefreshScreenData() {
        didLoad()
    }
}

