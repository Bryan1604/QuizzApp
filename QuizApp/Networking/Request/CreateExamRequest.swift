//
//  CreateExamRequest.swift
//  QuizApp
//
//  Created by Luong Vu on 5/17/23.
//

import Foundation

enum CreateExamRequest{
    struct Post: BaseRequest{
        var route: APIRoute{
            return APIRoute.createExam__post(param: self)
        }
        let question_exam_list: [QuestionExam?]
        let user_id: Int
        let subject_id: Int
        let title: String
        let time: Int
        let number: Int
        let status: Int?
        
        struct QuestionExam: Codable{
            var question_title: String
            var question_image: String?
            var question_level: Int
            var question_sort: Int
            var answer_list: [AnswerList?]
            var question_image_url: String?
            
            struct AnswerList: Codable{
                var content: String
                var type: Int
                var sort: Int
                var image_url: String?
                var image: String?
            }
        }
        
        
    }
}
