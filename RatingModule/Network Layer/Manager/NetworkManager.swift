import Foundation

enum NetworkResponse:String {
    case success
    case failed = "internal server error message"
    case noData = "not found message"
    case unableToDecode = "We could not decode the response."
}

enum Result<String>{
    case success
    case failure(String)
}

struct NetworkManager {
    static let environment : NetworkEnvironment = .production
    let router = Router<RatingApi>()
    
    func getRatings(query: String, completion: @escaping (_ response: RatingsResponse?,_ error: String?)->()) {
        if AppConstant.MockData.isEnable {
           if let response: RatingsResponse = RatingsResponse.getObjectFromJSONFile(fileName: AppConstant.Copy.jsonFileName, forKey: nil, fileType: AppConstant.Copy.fileType) {
                completion(response,nil)
            }
        } else {
            router.request(.details(query: query)) { data, response, error in
                
                if error != nil {
                    completion(nil, "Please check your network connection.")
                }
                
                if let response = response as? HTTPURLResponse {
                    let result = self.handleNetworkResponse(response)
                    switch result {
                    case .success:
                        guard let responseData = data else {
                            completion(nil, NetworkResponse.noData.rawValue)
                            return
                        }
                        do {
                            print(responseData)
                            let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                            print(jsonData)
                            let apiResponse = try JSONDecoder().decode(RatingsResponse.self, from: responseData)
                            completion(apiResponse,nil)
                        }catch {
                            print(error)
                            completion(nil, NetworkResponse.unableToDecode.rawValue)
                        }
                    case .failure(let networkFailureError):
                        completion(nil, networkFailureError)
                    }
                }
            }
        }
    }
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String>{
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.noData.rawValue)
        case 501...599: return .failure(NetworkResponse.failed.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}
