//
//  SavedDepartmentResponse.swift
//  QuizApp
//
//  Created by Luong Vu on 5/10/23.
//

import Foundation

struct SavedDepartmentResponse: BaseResponse{
    var statusCode: Int?
    var message: String?
    var result: [Result]?
    
    struct Result: Codable{
        var id: Int?
        var title: String?
        var image: String?
        var description: String?
    }
}
