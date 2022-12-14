
import Foundation

struct SignIn: Codable{
    let userId: String
    let password: String
}

struct SignInResponse: Codable{
    let accessToken: String
    let refreshToken: String
    let expiredAt: Date
}
