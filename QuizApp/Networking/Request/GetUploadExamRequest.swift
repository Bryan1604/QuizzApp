//
//  GetUploadExamRequest.swift
//  QuizApp
//
//  Created by Luong Vu on 5/19/23.
//

import Foundation

enum GetUploadExamRequest{
    struct Post: BaseRequest{
        var route: APIRoute{
            return APIRoute.getUploadExam__post(param: self)
        }
        let user_id: Int
    }
}
