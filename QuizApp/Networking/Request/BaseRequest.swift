//
//  BaseRequest.swift
//  QuizApp
//
//  Created by Luong Vu on 4/11/23.
//

import Foundation

protocol BaseRequest: Codable{
    var route: APIRoute{get}
}

enum APIPath: String{
    case login = "/login"
    case register = "/register"
    case forgotPassword = "/forgotPassword"
    case getDepartmentList = "/getDepartmentList"
    case listDepartmentInfo = "/listDepartmentInfo"
    case searchSubject = "/searchSubject"
    case listExam = "/listExam"
    case examDetail = "/examDetail"
    case examListQuestion = "/examListQuestion"
    case submitExam = "/submitExam"
    case getExamResult = "/getExamResult"
    case getExamHistoryList = "/getExamHistoryList"
    case getExamHistoryDetail = "/getExamHistoryDetail"
    case savedDepartment = "/savedDepartment"
    case savedSubject = "/savedSubject"
    case getUserInfo = "/getUserInfo"
    case chagePassword = "/changePassword"
    case updateUserInfo = "/updateUserInfo"
    case editAvatar = "/editAvatar"
    case changeEmail = "/changeEmail"
    case createExam = "/createExam"
    case postUploadFile = "/postUploadFile"
    case checkResetkey = "/checkResetKey"
    case getUploadExam = "/getUploadExam"
}
