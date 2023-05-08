//
//  ExamListQuestionRequest.swift
//  QuizApp
//
//  Created by Luong Vu on 4/24/23.
//

import Foundation

enum ExamListQuestionRequest{
    struct Post: BaseRequest{
        var route: APIRoute{
            return APIRoute.examListQuestion__post(param: self)
        }
        let user_id: Int
        let exam_id: Int
    }
}
