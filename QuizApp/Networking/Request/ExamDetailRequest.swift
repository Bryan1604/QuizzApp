//
//  ExamDetailRequest.swift
//  QuizApp
//
//  Created by Luong Vu on 4/23/23.
//

import Foundation

enum ExamDetailRequest{
    struct Post: BaseRequest{
        var route: APIRoute{
            return APIRoute.examDetail__post(param: self)
        }
        let user_id: Int
        let exam_id: Int
    }
}
