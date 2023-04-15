//
//  GetDepatmentListRequest.swift
//  QuizApp
//
//  Created by Luong Vu on 4/12/23.
//

import Foundation

enum GetDepartmentListRequest{
    struct Post: BaseRequest{
        var route: APIRoute{
            return APIRoute.getDepartmentList__post(param: self)
        }
        
        let user_id: Int
        let keyword: String?
    }
}
