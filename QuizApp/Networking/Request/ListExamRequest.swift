//
//  ListExamRequest.swift
//  QuizApp
//
//  Created by Luong Vu on 4/18/23.
//

import Foundation

enum ListExamRequest{
    struct Post: BaseRequest{
        var route: APIRoute{
            return APIRoute.listExam__post(param: self)
        }
        let user_id: Int
        let subject_id: Int
        let type: Int?
        let sort_field: Int?
        let sort_by: String?
    }

}
