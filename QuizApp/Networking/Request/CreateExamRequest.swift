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
            let question_title: String
            let question_image: String?
            let question_level: Int
            let question_sort: Int
            let answer_list: [AnswerList?]
            let question_image_url: String?
            
            struct AnswerList: Codable{
                let content: String
                let type: Int
                let sort: Int
                let image_url: String?
                let image: String
            }
        }
        
        
    }
}
