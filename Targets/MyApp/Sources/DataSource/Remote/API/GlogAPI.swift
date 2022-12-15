
import Moya
import Foundation

protocol GlogAPI: TargetType, JWTTokenAuthorizable{
    var domain: GlogDomain {get}
    var urlPath: String {get}
    var errorMapper: [Int: GlogError]? {get}
}

extension GlogAPI{
    var baseURL: URL{
        #if DEBUG
        return URL(string:"http://glog-env.eba-pvh8srk2.ap-northeast-2.elasticbeanstalk.com")!
        #else
        return URL(string: "http://glog-env.eba-pvh8srk2.ap-northeast-2.elasticbeanstalk.com")!
        #endif
    }
    var path: String{
        return domain.url + urlPath
    }
    var validationType: ValidationType{
        return .successCodes
    }
    var headers: [String : String]?{
        switch self{
        default:
            return ["Content-Type": "application/json"]
        }
    }
}

enum GlogDomain: String {
    case image
    case auth
    case user
}

extension GlogDomain {
    var url: String {
        return "/\(self.rawValue)"
    }
}
