//
//  SavedExamRequest.swift
//  QuizApp
//
//  Created by Luong Vu on 5/22/23.
//

import Foundation

enum SavedExamRequest{
    struct Post: BaseRequest{
        var route: APIRoute{
            return APIRoute.savedExam__post(param: self)
        }
        let user_id: Int
        let subject_id: Int
        let type: Int?
        let sort_field: Int?
        let sort_by: String?
    }
}
