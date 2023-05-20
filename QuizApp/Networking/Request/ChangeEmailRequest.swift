//
//  ChangeEmailRequest.swift
//  QuizApp
//
//  Created by Luong Vu on 5/15/23.
//

import Foundation

enum ChangeEmailRequest{
    struct Post: BaseRequest{
        var route: APIRoute{
            return APIRoute.changeEmail__post(param: self)
        }
        let user_id: Int
        let email: String
    }
}
