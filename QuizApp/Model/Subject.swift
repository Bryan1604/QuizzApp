//
//  Subject.swift
//  QuizApp
//
//  Created by Luong Vu on 4/18/23.
//

import Foundation

class Subject {
    var id : Int?
    var title: String?
    var image: String?
    var description: String?
    var count_exam: Int?
    init(id: Int? = nil, title: String? = nil, image: String? = nil, description: String? = nil, count_exam: Int? = nil) {
        self.id = id
        self.title = title
        self.image = image
        self.description = description
        self.count_exam = count_exam
    }
}
