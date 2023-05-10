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

}
