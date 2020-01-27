import Foundation
class DataManager {
    static let sharedInstance = DataManager()
    func requetRatingData(_ query: String)-> RatingsResponse? {
        if AppConstant.MockData.isEnable {
            if let response: RatingsResponse = RatingsResponse.getObjectFromJSONFile(fileName: AppConstant.Copy.jsonFileName, forKey: nil, fileType: AppConstant.Copy.fileType) {
                return response
            }
            return nil
           
        } else {
            let networkManager = NetworkManager()
            var ratingResponse: RatingsResponse?
            networkManager.getRatings(query: query, completion: { (response, error) in
                ratingResponse = response
            })
            return ratingResponse
        }
    }
}
