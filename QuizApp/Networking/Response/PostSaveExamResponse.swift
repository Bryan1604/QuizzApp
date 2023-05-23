//
//  PostSaveExamResponse.swift
//  QuizApp
//
//  Created by Luong Vu on 5/22/23.
//

import Foundation

struct PostSaveExamResponse: BaseResponse{
    var statusCode: Int?
    var message: String?
    var result: [Result]
    
    struct Result: Codable{
        var exam_id: Int?
        var user_id: Int?
        var create_at: String?
    }
}
