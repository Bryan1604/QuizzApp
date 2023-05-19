//
//  GetUserInfoRequest.swift
//  QuizApp
//
//  Created by Luong Vu on 5/15/23.
//

import Foundation

enum GetUserInfoRequest{
    struct Post: BaseRequest{
        var route: APIRoute{
            return APIRoute.getUserInfo__post(param: self)
        }
        let user_id: Int
    }
}
