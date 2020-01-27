import Foundation
class DataManager {
    static let sharedInstance = DataManager()
    var ratingResponse: RatingsResponse?
    func requetRatingData(_ query: String)-> RatingsResponse? {
        if AppConstant.MockData.isEnable {
            if let response: RatingsResponse = RatingsResponse.getObjectFromJSONFile(fileName: AppConstant.Copy.jsonFileName, forKey: nil, fileType: AppConstant.Copy.fileType) {
                return response
            }
            return nil
           
        } else {
            let networkManager = NetworkManager()
            networkManager.getRatings(query: query, completion: { [weak self] (response, error) in
                self?.ratingResponse = response
            })
            return ratingResponse
        }
    }
}
