//
//  ChangePasswordRequest.swift
//  QuizApp
//
//  Created by Luong Vu on 4/12/23.
//

import Foundation

enum ForgotPasswordRequest{
    struct Post: BaseRequest{
        var route: APIRoute{
            return APIRoute.forgotPassword__post(param: self)
        }
        
        let email: String
    }
    
}
