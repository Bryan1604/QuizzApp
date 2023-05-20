//
//  GetUploadExamResponse.swift
//  QuizApp
//
//  Created by Luong Vu on 5/19/23.
//

import Foundation

struct GetUploadExamResponse: BaseResponse{
    var statusCode: Int?
    var message: String?
    var result: [Result]
    
    struct Result: Codable{
        var number: Int?
        var time: Int?
        var title: String?
    }
}
