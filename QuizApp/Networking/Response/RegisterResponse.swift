//
//  RegisterResponse.swift
//  QuizApp
//
//  Created by Luong Vu on 4/12/23.
//

import Foundation

struct RegisterResponse: BaseResponse{
    
    var statusCode: Int?
    var message: String?
    var result: Result
    
    struct Result: Codable{
        var access_token: String?
        var user_id: Int?
    }
}
