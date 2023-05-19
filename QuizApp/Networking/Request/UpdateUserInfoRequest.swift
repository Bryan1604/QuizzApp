//
//  UpdateUserInfo.swift
//  QuizApp
//
//  Created by Luong Vu on 5/15/23.
//

import Foundation

enum UpdateUserInfoRequest{
    struct Post: BaseRequest{
        var route: APIRoute{
            return APIRoute.updateUserInfo__post(param: self)
        }
        let user_id: Int
        let name: String
        let birthday: String?
    }
}
