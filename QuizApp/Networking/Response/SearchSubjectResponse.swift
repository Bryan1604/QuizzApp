//
//  searchSubjectResponse.swift
//  QuizApp
//
//  Created by Luong Vu on 4/18/23.
//

import Foundation

struct SearchSubjectResponse: BaseResponse{
    var statusCode: Int?
    var message: String?
    var result: [Result]
    
    struct Result: Codable{
        var id : Int?
        var title: String?
        var image: String?
        var description: String?
        var count_exam: Int?
    }

}
