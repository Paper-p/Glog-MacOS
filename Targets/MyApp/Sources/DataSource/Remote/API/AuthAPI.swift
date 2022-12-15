
import Moya
import Foundation

enum AuthAPI{
    case login(idToken: String)
    case refresh
}

extension AuthAPI: GlogAPI {
    var domain: GlogDomain{
        return .auth
    }
    var urlPath: String{
        switch self {
        case .login:
            return "/auth"
        case .refresh:
            return ""
        }
    }
    var method: Moya.Method {
        switch self {
        case .login:
            return .post
        case .refresh:
            return .patch
        }
    }
    var task: Task{
        switch self {
        case let .login(req):
            return .requestParameters(parameters: [
                "idToken":req
            ], encoding: JSONEncoding.default)
        case let .refresh:
            return .requestPlain
        }
    }
    var jwtTokenType: JWTTokenType?{
        switch self {
        default:
            return JWTTokenType.none
        }
    }
    var errorMapper: [Int : GlogError]?{
        switch self {
        case .login:
            return [
                400: .invalidToken,
                403: .notGlogUser,
                404: .notExistUser
            ]
        case .refresh:
            return [
                400: .invalidToken,
                401: .unuthorized,
                404: .notFoundUser
            ]
        }
    }
}
