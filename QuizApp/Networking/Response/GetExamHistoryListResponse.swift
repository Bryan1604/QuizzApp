//
//  GetExamHistoryList.swift
//  QuizApp
//
//  Created by Luong Vu on 5/9/23.
//

import Foundation

struct GetExamHistoryListResponse: BaseResponse{
    var statusCode: Int?
    var message: String?
    var result: [Result]?
    
    struct Result: Codable{
        var id: Int?
        var title: String?
        var number: Int?
        var user_create: Int?
        var image: String?
        var score: String?
    }
}
