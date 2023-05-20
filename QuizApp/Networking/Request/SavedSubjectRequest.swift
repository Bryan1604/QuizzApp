//
//  savedSubjectRequest.swift
//  QuizApp
//
//  Created by Luong Vu on 5/12/23.
//

import Foundation

enum SavedSubjectRequest{
    struct Post: BaseRequest{
        var route: APIRoute{
            return APIRoute.savedSubject__post(param: self)
        }
        let user_id: Int
        let department_id: Int

    }
}
