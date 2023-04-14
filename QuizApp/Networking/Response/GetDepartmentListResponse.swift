//
//  GetDepartmentListResponse.swift
//  QuizApp
//
//  Created by Luong Vu on 4/12/23.
//

import Foundation

struct GetDepartmentListResponse: BaseResponse{
    var message: String?
    var statusCode: Int?
    var result: [Result]
    
    struct Result: Codable{
        var id: Int?
        var title: String?
        var description: String?
        var image: String?
        var student_list: String?
//        var subject_list: [SubjectList]
        
        
//        struct SubjectList: Codable{
//        }
        
    }
}
