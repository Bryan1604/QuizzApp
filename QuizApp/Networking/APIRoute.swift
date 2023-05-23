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
    case getExamHistoryDetail__get(param: GetExamHistoryDetailRequest.Get)
    case savedDepartment__post(param: SavedDepartmentRequest.Post)
    case savedSubject__post(param: SavedSubjectRequest.Post)
    case getUserInfo__post(param: GetUserInfoRequest.Post)
    case changePassword__post(param: ChangePasswordRequest.Post)
    case updateUserInfo__post(param: UpdateUserInfoRequest.Post)
    case editAvatar__post(param: EditAvatarRequest.Post)
    case changeEmail__post(param: ChangeEmailRequest.Post)
    case createExam__post(param: CreateExamRequest.Post)
    case postUploadFile__post(param: PostUploadFileRequest.Post)
    case checkResetKey__post(param: CheckResetKeyRequest.Post)
    case getUploadExam__post(param: GetUploadExamRequest.Post)
    case postSaveExam__post(param: PostSaveExamRequest.Post)
    case savedExam__post(param: SavedExamRequest.Post)
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
        case .getExamHistoryDetail__get:
            return .get
        case .savedDepartment__post:
            return .post
        case .savedSubject__post:
            return .post
        case .getUserInfo__post:
            return .post
        case .changePassword__post:
            return .post
        case .updateUserInfo__post:
            return .post
        case .editAvatar__post:
            return .post
        case .changeEmail__post:
            return .post
        case .createExam__post:
            return .post
        case .postUploadFile__post:
            return .post
        case .checkResetKey__post:
            return .post
        case .getUploadExam__post:
            return .post
        case .postSaveExam__post:
            return .post
        case .savedExam__post:
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
        case .getExamHistoryDetail__get:
            return APIPath.getExamHistoryDetail.rawValue
        case .savedDepartment__post:
            return APIPath.savedDepartment.rawValue
        case .savedSubject__post:
            return APIPath.savedSubject.rawValue
        case .getUserInfo__post:
            return APIPath.getUserInfo.rawValue
        case .changePassword__post:
            return APIPath.chagePassword.rawValue
        case .updateUserInfo__post:
            return APIPath.updateUserInfo.rawValue
        case .editAvatar__post:
            return APIPath.editAvatar.rawValue
        case .changeEmail__post:
            return APIPath.changeEmail.rawValue
        case .createExam__post:
            return APIPath.createExam.rawValue
        case .postUploadFile__post:
            return APIPath.postUploadFile.rawValue
        case .checkResetKey__post:
            return APIPath.checkResetkey.rawValue
        case .getUploadExam__post:
            return APIPath.getUploadExam.rawValue
        case .postSaveExam__post:
            return APIPath.postSaveExam.rawValue
        case .savedExam__post:
            return APIPath.savedExam.rawValue
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
        case .getExamHistoryDetail__get(let param):
            return param.dictionary
        case .savedDepartment__post(let param):
            return param.dictionary
        case .savedSubject__post(let param):
            return param.dictionary
        case .getUserInfo__post(let param):
            return param.dictionary
        case .changePassword__post(let param):
            return param.dictionary
        case .updateUserInfo__post(let param):
            return param.dictionary
        case .editAvatar__post(let param):
            return param.dictionary
        case .changeEmail__post(let param):
            return param.dictionary
        case .createExam__post(let param):
            return param.dictionary
        case .postUploadFile__post(let param):
            return param.dictionary
        case .checkResetKey__post(let param):
            return param.dictionary
        case .getUploadExam__post(let param):
            return param.dictionary
        case .postSaveExam__post(let param):
            return param.dictionary
        case .savedExam__post(let param):
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
                case .getExamHistoryDetail__get:
                    return try URLEncoding.default.encode(request, with: parameters)
                case .savedDepartment__post:
                    return try JSONEncoding.default.encode(request, with: parameters)
                case .savedSubject__post:
                    return try JSONEncoding.default.encode(request, with: parameters)
                case .getUserInfo__post:
                    return try JSONEncoding.default.encode(request, with: parameters)
                case .changePassword__post:
                    return try JSONEncoding.default.encode(request, with: parameters)
                case .updateUserInfo__post:
                    return try JSONEncoding.default.encode(request, with: parameters)
                case .editAvatar__post:
                    return try JSONEncoding.default.encode(request, with: parameters)
                case .changeEmail__post:
                    return try JSONEncoding.default.encode(request, with: parameters)
                case .createExam__post:
                    return try JSONEncoding.default.encode(request, with: parameters)
                case .postUploadFile__post:
                    return try JSONEncoding.default.encode(request, with: parameters)
                case .checkResetKey__post:
                    return try JSONEncoding.default.encode(request, with: parameters)
                default:
                    return try JSONEncoding.default.encode(request, with: parameters)
                }
            }
    }
