//
//  GetUserInfoResponse.swift
//  QuizApp
//
//  Created by Luong Vu on 5/15/23.
//

import Foundation


struct GetUserInfoResponse: BaseResponse{
    var statusCode: Int?
    var message: String?
    var result: Result?
    
    struct Result: Codable{
        var access_token: String
        var avatar : String?
        var birthday: String?
        var email: String
        var id: Int
        var name: String
        var phone_numbe: String?
        var role: Int
        var status: Int
    }
}
