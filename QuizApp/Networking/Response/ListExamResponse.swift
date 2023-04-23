//
//  ListExamResponse.swift
//  QuizApp
//
//  Created by Luong Vu on 4/18/23.
//

import Foundation

struct ListExamResponse: BaseResponse{
    var statusCode: Int?
    var message: String?
    var result: Result
    
    struct Result: Codable{
        var department_description: String?
        var department_id: Int?
        var department_title: String?
        var description: String?
        var id: Int?
        var list_exam: [Exam]?
        struct Exam: Codable{
            var author_email: String?
            var author_id: Int?
            var author_name: String?
            var id: Int?
            var image: String?
            var number: Int?
            var saved_num: Int?
            var status: Int?
            var time: Int?
            var title: String?
        }
        var title: String?
    }
}
