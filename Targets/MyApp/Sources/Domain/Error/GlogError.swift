
import Foundation

public enum GlogError: Error{
    case error(message: String = "에러가 발생했습니다.", errorBody: [String: Any] = [:])
    
    case noInternet
    //MARK: - 400
    case invalidToken
    
    //MARK: - 401
    case unuthorized
    
    //MARK: - 403
    case notGlogUser
    case notExistUser
    
    //MARK: - 404
    case notFoundUser
}

extension GlogError: LocalizedError{
    public var errorDescription: String?{
        switch self {
        case let .error(message, _):
            return message
        case .noInternet, .invalidToken, .unuthorized, .notGlogUser, .notExistUser, .notFoundUser:
            return "알수없는 에러가 발생했습니다. 잠시 후 다시 시도해 주세요."
        }
    }
}
