import Alamofire
import Foundation

final class SignInVM{
    
    private let decoder = JSONDecoder()
    
    func fetchData(id: String, password: String){
        
        let url = "http://glog-env.eba-pvh8srk2.ap-northeast-2.elasticbeanstalk.com/auth/signin"
        
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        
        let params = ["userId": id, "password": password]
        
        AF.request(url, method: .post,parameters: params ,encoding: JSONEncoding.default, headers: headers).validate(statusCode: 200...500).responseString { response in
            switch response.result{
            case .success:
                print(response.value ?? "")
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
