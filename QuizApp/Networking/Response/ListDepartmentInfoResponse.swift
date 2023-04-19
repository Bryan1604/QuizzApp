//
//  listDepartmentInfoResponse.swift
//  QuizApp
//
//  Created by Luong Vu on 4/17/23.
//

import Foundation

struct ListDepartmentInfoResponse: BaseResponse{
    var statusCode: Int?
    var message: String?
    var result: [Result]
    
    struct Result: Codable{
        var id : Int?
        var title: String?
        var image: String?
        var subjects: [Subject]?
        
        struct Subject: Codable{
            var id: Int?
            var title: String?
            var image: String?
        }
    }
    
    
}
