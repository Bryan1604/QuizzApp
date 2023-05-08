//
//  submitExamResponse.swift
//  QuizApp
//
//  Created by Luong Vu on 5/8/23.
//

import Foundation

struct SubmitExamResponse: BaseResponse{
    var statusCode: Int?
    var message: String?
    var result: Result?
    
    struct Result: Codable{
        var correct_number: Int?
        var create_at: String?
        var exam_id: Int?
        var exam_result: [String: Int?]
        var finish_time: String?
        var score: Double?
        var skip_number: Int?
        var start_time: String?
        var update_at : String?
        var user_id: Int?
        var wrong_number: Int?
    }
}
