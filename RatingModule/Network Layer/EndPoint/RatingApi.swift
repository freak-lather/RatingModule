import Foundation

enum NetworkEnvironment {
    case qa
    case production
    case staging
}
enum RatingApi {
    case details(query: String)
}
enum QueryType: String {
    case All = "All"
    case TODAY = "TODAY"
    case LAST_7_DAYS = "LAST_7_DAYS"
    case LAST_30_DAYS = "LAST_30_DAYS"
    var type: String {
        switch self {
        case .All:
            return "All"
        case .TODAY:
            return "TODAY"
        case .LAST_7_DAYS:
            return "LAST_7_DAYS"
        case .LAST_30_DAYS:
            return "LAST_30_DAYS"
        }
    }
}

extension RatingApi: EndPointType {
    var environmentBaseURL : String {
        switch NetworkManager.environment {
        case .production: return "https://skyrim.whipmobility.io/v10/"
        case .qa: return ""
        case .staging: return ""
        }
    }
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else {
            return URL(string: "")!
        }
        return url
    }
    
    var path: String {
        switch self {
        case .details:
            return "analytic/dashboard/operation/mock"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .details:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .details(let query):
            return .requestParametersAndHeaders(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: self.getQueryItem(query: query), additionHeaders: headers)
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    func getQueryItem(query: String) -> [String: Any] {
        var queryDic = [String: Any]()
        queryDic["scope"] = query
        return queryDic
    }
}
