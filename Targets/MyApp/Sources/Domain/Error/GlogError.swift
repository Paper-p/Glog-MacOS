
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
