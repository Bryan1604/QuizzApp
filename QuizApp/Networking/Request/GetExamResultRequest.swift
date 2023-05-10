//
//  GetExamResultRequest.swift
//  QuizApp
//
//  Created by Luong Vu on 5/8/23.
//

import Foundation

enum GetExamResultRequest{
    struct Post: BaseRequest{
        var route: APIRoute{
            return APIRoute.getExamResult__post(param: self)
        }
        let user_id: Int
        let exam_history_id: Int
    }
}
