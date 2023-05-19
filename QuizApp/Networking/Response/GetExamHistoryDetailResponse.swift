//
//  GetExamHistoryDetailResponse.swift
//  QuizApp
//
//  Created by Luong Vu on 5/10/23.
//

import Foundation

struct GetExamHistoryDetailResponse: BaseResponse{
    var statusCode: Int?
    var message: String?
    var result: Result?
    
    struct Result: Codable{
        var id: Int?  //
        var description: String? //
        var exam_title: String?//
        var time : Int? //
        var number: Int? //
        var score : String? //
        var subject_title: String? //
        var user_name: String? //
        var user_id: Int? //
        var wrong_number: Int?
    }
}

