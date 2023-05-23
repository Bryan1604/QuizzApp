//
//  SavedExamResponse.swift
//  QuizApp
//
//  Created by Luong Vu on 5/22/23.
//

import Foundation

struct SavedExamResponse: BaseResponse{
    var statusCode: Int?
    var message: String?
    var result: Result
    
    struct Result: Codable{
        var department_title: String?
        var exam_list:[Exam]?
        var subject_title: String?
        struct Exam: Codable{
            var author_email: String?
            var author_id: Int?
            var author_name: String?
            var number: Int?
            var saved_number: Int?
            var status: Int?
            var time: Int?
            var title: String?
            var image: String?
            var id: Int?
        }
    }
}
