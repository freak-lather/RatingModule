import Foundation

@testable import RatingModule
class RatingRepositoryMock: RatingsRepositoryProtocol {
    var getAllRatingCalledSuccessfully = false
    func getRatingsDetails(query: String, handler:@escaping (RatingsResponse?, String?)-> Void) -> Void {
        getAllRatingCalledSuccessfully = true
        handler(nil, nil)
    }
}
class DisplayRatingMock: DisplayRatingDetailProtocol {
    var fetchAllRatingCalledSuccessfully = false
    func fetchDetails(query: String, handler: @escaping (RatingsResponse?, String?) -> Void) {
        fetchAllRatingCalledSuccessfully = true
        handler(nil, nil)
    }
}
