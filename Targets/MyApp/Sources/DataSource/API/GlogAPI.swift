
import Moya

protocol GlogAPI: TargetType, JWTTokenAuthorizable{
    var domain: GlogDomain {get}
    var urlPath: String {get}
    var errorMapper: [Int: GlogError]? {get}
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
