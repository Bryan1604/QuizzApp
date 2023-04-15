//
//  RegisterRequest.swift
//  QuizApp
//
//  Created by Luong Vu on 4/12/23.
//

import Foundation

enum RegisterRequest{
    struct Post: BaseRequest{
        var route: APIRoute{
            return APIRoute.register__post(param: self)
        }
        
        let email : String
        let password: String
        let phone_number: String
        let birthday: String
        let name: String
    }
}
