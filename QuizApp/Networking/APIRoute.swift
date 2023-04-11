//
//  APIRoute.swift
//  QuizApp
//
//  Created by Luong Vu on 4/11/23.
//

import Foundation
import Alamofire

enum APIRoute: URLRequestConvertible{
    case login__post(param : LoginRequest.Post)
    
    var baseURLString: String{
        return "https://asia-northeast1-quiz-app-traning.cloudfunctions.net"
    }
    
    // tra ve method cho request
    var method: HTTPMethod{
        switch self{
        case .login__post:
            return .post
        }
    }
    
    var path: String{
        switch self{
        case .login__post:
            return APIPath.login.rawValue
        }
    }
    
    var parameters: Parameters?{
        switch self{
        case .login__post(let param):
            return param.dictionary
        }
    }
    
    var headers: HTTPHeaders{
        var headers = HTTPHeaders()
        headers["Authorization"] = UserDefaults.standard.string(forKey: "access_token")
        return headers
    }
    
    func asURLRequest() throws -> URLRequest {
        guard let baseUrl = URL(string: baseURLString) else{
            fatalError("Base URL is invalid: \(baseURLString)")
        }
        
        let request = try URLRequest(url: baseUrl.appendingPathComponent(path), method: method, headers: headers)
        switch self {
        case .login__post:
            return try JSONEncoding.default.encode(request, with: parameters)
//        default:
//            return try JSONEncoding.default.encode(request, with: parameters)
        }
    }
}

