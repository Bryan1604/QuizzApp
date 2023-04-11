//
//  APIHandle.swift
//  QuizApp
//
//  Created by Luong Vu on 4/5/23.
//

import Foundation
import Alamofire
 /*
enum APIHandle: UIRequeseConvertible{
    case
    var baseURLString: String{
        return
    }
    
    var method: HTTPMethod{
        switch self{
        case .login__post:
            return .post
            
        case .departmentList__post:
            return .post
        }
    }
    
    var path: String{
        switch self{
        case .login__post:
            
        }
    }
    
    var parameters: Parameters?{
        var parameter = Parameters()
        switch self{
        case .login__post(let login_id, let password):
            parameter["login_id"] = loginId
            return parameter
        case .
            return parameter
        }
    }
    
    var header: HTTPHeaders{
        var header = HTTPHeaders()
        headers["Authorization"] = UserDefaults.standard.string["token"]
        return header
    }
    
    func asURLRequest() throws -> URLRequest{
        guard let baseURL = URL(string: baseURLString) else{
            faltaError
        }
    }
}
*/

class APIHandle{
    static let sharedInstance = APIHandle()
    
    func loginAPI(login_id: String, password: String, completion: @escaping( Bool, String?)-> Void){
        let url = "https://asia-northeast1-quiz-app-traning.cloudfunctions.net/login"
        //let parameters: Parameters = ["login_id": login_id, "password": password]
        let parameters: [String:Any] = ["login_id": login_id, "password": password]
        AF.request(url,method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                if let json = value as? [String: Any],let statusCode = json["statusCode"] as? Int {
                    if statusCode == 200{
                        let result = json["result"] as? [String: Any]
                        UserDefaults.standard.set(result?["access_token"], forKey: "AccessToken")
                        //UserDefaults.standard.string(forKey: "AccessToken")
                    }else{
                        let errorMessage = json["message"] as? String ?? "Unknown error"
                        completion(false, errorMessage)
                    }
                    
                } else {
                    completion(false, "Error parsing response")
                }
            case .failure(let error):
                completion(false, error.localizedDescription)
                print("heelo")
            }
        }
    }
    

    func registerAPI(email: String, password: String, phone_number: String, birthday:String,name:String, completion: @escaping (Bool, String?) -> Void) {
        // Định nghĩa URL của API đăng ký
        let url = "https://asia-northeast1-quiz-app-traning.cloudfunctions.net/register"
        
        // Định nghĩa các tham số cho request POST đăng ký, bao gồm email và password của người dùng
        let parameters: [String: Any] = ["email": email, "password": password, "phone_number": phone_number, "birthday": birthday, "name":name]
        
        // Gửi một request POST đến địa chỉ URL của API đăng ký, sử dụng Alamofire để xử lý các tương tác mạng
        AF.request(url, method: .post, parameters: parameters).validate().responseJSON { response in
            switch response.result {
            // Nếu request thành công
            case .success(let value):
                // Nếu JSON response có dạng key-value và có giá trị "success" là true
                if let json = value as? [String: Any], let success = json["success"] as? Int {
                    if success == 200 {
                        // Đăng ký thành công, gọi completion handler với success flag là true và errorMessage là nil
                        completion(true, nil)
                        print("success")
                    } else {
                        // Đăng ký thất bại, lấy thông báo lỗi từ JSON response (nếu có) hoặc sử dụng thông báo lỗi mặc định
                        let errorMessage = json["message"] as? String ?? "Unknown error"
                        completion(false, errorMessage)
                    }
                } else {
                    // Response không hợp lệ hoặc không có giá trị "success"
                    completion(false, "Error parsing response")
                }
            // Nếu request thất bại
            case .failure(let error):
                // Đăng ký thất bại vì có lỗi, gọi completion handler với success flag là false và errorMessage là mô tả lỗi được trả về từ request
                completion(false, error.localizedDescription)
            }
        }
    }
    
}
