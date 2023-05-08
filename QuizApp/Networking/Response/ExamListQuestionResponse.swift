//
//  ExamListQuestionResponse.swift
//  QuizApp
//
//  Created by Luong Vu on 4/24/23.
//

import Foundation

struct ExamListQuestionResponse: BaseResponse{
    var statusCode: Int?
    var message: String?
    var result: Result?
    
    struct Result: Codable{
        var id: Int?
        var exam_question_list: [ExamQuestion]?
        
        struct ExamQuestion: Codable{
            var question_id: Int?
            var question_title: String?
            var question_image: String?
            var question_level: Int?
            var question_sort: Int?
            var answer_list: [Answer]?
            
            struct Answer: Codable{
                var answer_id: Int?
                var content: String?
                var type: Int?
                var sort: Int?
                var image: String?
            }
            
            var answer_id: Int?
            var is_selected: Bool?
        }
    }
}
