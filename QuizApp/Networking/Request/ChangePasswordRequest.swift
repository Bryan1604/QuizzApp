//
//  ChangePasswordRequest.swift
//  QuizApp
//
//  Created by Luong Vu on 5/15/23.
//

import Foundation

enum ChangePasswordRequest{
    struct Post: BaseRequest{
        var route: APIRoute{
            return APIRoute.changePassword__post(param: self)
        }
        let user_id: Int
        let password: String
        let cf_password: String
    }
}
