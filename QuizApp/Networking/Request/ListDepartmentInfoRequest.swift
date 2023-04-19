//
//  ListDepartmentINFO.swift
//  QuizApp
//
//  Created by Luong Vu on 4/17/23.
//

import Foundation

enum ListDepartmentInfoRequest{
    struct Post: BaseRequest{
        var route: APIRoute{
            return APIRoute.listDepartmentInfo__post(param: self)
        }
        let user_id: Int
    }
    
}
