//
//  searchSubjectRequest.swift
//  QuizApp
//
//  Created by Luong Vu on 4/18/23.
//

import Foundation

enum SearchSubjectRequest{
    struct Post: BaseRequest{
        var route: APIRoute{
            return APIRoute.searchSubject__post(param: self)
        }
        let user_id: Int
        let department_id: Int?
        let keyword: String?
    }

}
