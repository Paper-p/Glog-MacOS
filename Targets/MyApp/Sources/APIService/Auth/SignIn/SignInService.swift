
import Foundation
import Moya

enum SignInService{
    case signIn(param: SignInRequest)
}

extension SignInService: TargetType{
    public var baseURL: URL{
        return URL(string: "http://glog-env.eba-pvh8srk2.ap-northeast-2.elasticbeanstalk.com")!
    }
    
    var path: String{
        switch self {
        case .signIn:
            return "/auth/signin"
        }
    }
    
    var method: Moya.Method{
        switch self {
        case .signIn:
            return .post
        }
    }
    
    var sampleData: Data {
        return "@@".data(using: .utf8)!
    }
    
    var task: Task{
        switch self {
        case .signIn(let param):
            return .requestJSONEncodable(param)
        }
    }
    
    var headers: [String : String]?{
        switch self {
        default:
            return["Content-Type" :"application/json"]
        }
    }
}
