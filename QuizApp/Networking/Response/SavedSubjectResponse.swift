//
//  SavedSubjectResponse.swift
//  QuizApp
//
//  Created by Luong Vu on 5/12/23.
//

import Foundation

struct SavedSubjectResponse: BaseResponse{
    var statusCode: Int?
    var message: String?
    var result: [Result]?
    
    struct Result: Codable{
        var department_title: String?
        var exam_number: Int?
        var id: Int?
        var image: String?
        var title: String?
    }
}
