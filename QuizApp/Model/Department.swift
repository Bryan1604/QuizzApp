//
//  Department.swift
//  QuizApp
//
//  Created by Luong Vu on 4/19/23.
//

import Foundation

class Department{
    var id: Int?
    var title: String?
    var description: String?
    var image: String?
    var studentList: String?
    init(id: Int? = nil, title: String? = nil, description: String? = nil, image: String? = nil, studentList: String? = nil) {
        self.id = id
        self.title = title
        self.description = description
        self.image = image
        self.studentList = studentList
    }
}
