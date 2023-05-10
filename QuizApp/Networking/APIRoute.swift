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
    case register__post( param: RegisterRequest.Post)
    case forgotPassword__post(param: ForgotPasswordRequest.Post )
    case getDepartmentList__post( param: GetDepartmentListRequest.Post)
    case listDepartmentInfo__post( param: ListDepartmentInfoRequest.Post)
    case searchSubject__post(param: SearchSubjectRequest.Post)
    case listExam__post(param: ListExamRequest.Post)
    case examDetail__post(param: ExamDetailRequest.Post)
    case examListQuestion__post(param: ExamListQuestionRequest.Post)
    case submitExam__post(param: SubmitExamRequest.Post)
    case getExamResult__post(param: GetExamResultRequest.Post)
    case getExamHistoryList__post(param: GetExamHistoryListRequest.Post)
    var baseURLString: String{
        return "https://asia-northeast1-quiz-app-traning.cloudfunctions.net"
    }
    
    // tra ve method cho request
    var method: HTTPMethod{
        switch self{
        case .login__post:
            return .post
        case .register__post:
            return .post
        case .forgotPassword__post:
            return .post
        case .getDepartmentList__post:
            return .post
        case .listDepartmentInfo__post:
            return .post
        case .searchSubject__post:
            return .post
        case .listExam__post:
            return .post
        case .examDetail__post:
            return .post
        case .examListQuestion__post:
            return .post
        case .submitExam__post:
            return .post
        case .getExamResult__post:
            return .post
        case .getExamHistoryList__post:
            return .post
        }
    }
    
    var path: String{
        switch self{
        case .login__post:
            return APIPath.login.rawValue
        case .register__post:
            return APIPath.register.rawValue
        case .forgotPassword__post:
            return APIPath.forgotPassword.rawValue
        case .getDepartmentList__post:
            return APIPath.getDepartmentList.rawValue
        case .listDepartmentInfo__post:
            return APIPath.listDepartmentInfo.rawValue
        case .searchSubject__post:
            return APIPath.searchSubject.rawValue
        case .listExam__post:
            return APIPath.listExam.rawValue
        case .examDetail__post:
            return APIPath.examDetail.rawValue
        case .examListQuestion__post:
            return APIPath.examListQuestion.rawValue
        case .submitExam__post:
            return APIPath.submitExam.rawValue
        case .getExamResult__post:
            return APIPath.getExamResult.rawValue
        case .getExamHistoryList__post:
            return APIPath.getExamHistoryList.rawValue
        }
        
    }
    
    var parameters: Parameters?{
        switch self{
        case .login__post(let param):
            return param.dictionary
        case .register__post(let param):
            return param.dictionary
        case .forgotPassword__post(let param):
            return param.dictionary
        case .getDepartmentList__post(let param):
            return param.dictionary
        case .listDepartmentInfo__post(let param):
            return param.dictionary
        case .searchSubject__post(let param):
            return param.dictionary
        case .listExam__post(let param):
            return param.dictionary
        case .examDetail__post(let param):
            return param.dictionary
        case .examListQuestion__post(let param):
            return param.dictionary
        case .submitExam__post(let param):
            return param.dictionary
        case .getExamResult__post(let param):
            return param.dictionary
        case .getExamHistoryList__post(let param):
            return param.dictionary
        }
    }
    
    var headers: HTTPHeaders{
        var headers = HTTPHeaders()
        headers["Authorization"] = UserDefaults.standard.string(forKey: "AccessToken")
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
        case .register__post:
            return try JSONEncoding.default.encode(request, with: parameters)
        case .forgotPassword__post:
            return try JSONEncoding.default.encode(request, with: parameters)
            //return try URLEncoding.default.encode(request, with: parameters)
        case .getDepartmentList__post:
            return try JSONEncoding.default.encode(request, with: parameters)
        case .listDepartmentInfo__post:
            return try JSONEncoding.default.encode(request, with: parameters)
        case .searchSubject__post:
            return try JSONEncoding.default.encode(request, with: parameters)
        case .listExam__post:
            return try JSONEncoding.default.encode(request, with: parameters)
        case .examDetail__post:
            return try JSONEncoding.default.encode(request, with: parameters)
        case .examListQuestion__post:
            return try JSONEncoding.default.encode(request, with: parameters)
        case .submitExam__post:
            return try JSONEncoding.default.encode(request, with: parameters)
        case .getExamResult__post:
            return try JSONEncoding.default.encode(request, with: parameters)
        case .getExamHistoryList__post:
            return try JSONEncoding.default.encode(request, with: parameters)

//        default:
//            return try JSONEncoding.default.encode(request, with: parameters)
        }
    }
}

