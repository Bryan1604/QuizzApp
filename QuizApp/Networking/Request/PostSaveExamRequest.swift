//
//  PostSaveExam.swift
//  QuizApp
//
//  Created by Luong Vu on 5/22/23.
//

import Foundation

enum PostSaveExamRequest{
    struct Post: BaseRequest{
        var route: APIRoute{
            return APIRoute.postSaveExam__post(param: self)
        }
        let user_id: Int
        let exam_id: Int
    }
}
