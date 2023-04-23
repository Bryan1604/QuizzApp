//
//  ExamDetailResponse.swift
//  QuizApp
//
//  Created by Luong Vu on 4/23/23.
//

import Foundation

struct ExamDetailResponse: BaseResponse{
    var statusCode: Int?
    var message: String?
    var result: Result?
    
    struct Result: Codable{
        var author_email: String?
        var author_id: Int?
        var author_name: String?
        var id: Int?
        var image: String?
        var number: Int?
        var status: Int?
        var time: Int?
        var title: String?
    }
}
