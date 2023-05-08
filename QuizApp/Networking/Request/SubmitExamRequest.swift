//
//  SubmitExamRequest.swift
//  QuizApp
//
//  Created by Luong Vu on 5/8/23.
//

import Foundation

enum SubmitExamRequest{
    struct Post: BaseRequest{
        var route: APIRoute{
            return APIRoute.submitExam__post(param: self)
        }
        let user_id: Int
        let exam_id: Int
        let answer_list: [String: Int?]
        let start_time: String
        let finish_time: String
    }
}
