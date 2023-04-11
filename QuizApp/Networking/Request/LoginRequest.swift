//
//  LoginRequest.swift
//  QuizApp
//
//  Created by Luong Vu on 4/11/23.
//

import Foundation

// tao request login
enum LoginRequest{
    struct Post: BaseRequest{
        var route: APIRoute{
            return APIRoute.login__post(param: self)
        }
        
        let login_id : String
        let password : String
    }
    
    
}

