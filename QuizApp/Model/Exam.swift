//
//  Exam.swift
//  QuizApp
//
//  Created by Luong Vu on 4/19/23.
//

import Foundation

class Exam{
    var author_email : String?
    var author_id : Int?
    var author_name: String?
    var id: Int?
    var image: String?
    var number: Int?
    var save_num: Int?
    var status: Int?
    var time: Int?
    var title: String?
    var description: String?
    init(author_email: String? = nil, author_id: Int? = nil, author_name: String? = nil, id: Int? = nil, image: String? = nil, number: Int? = nil, save_num: Int? = nil, status: Int? = nil, time: Int? = nil, title: String? = nil, description: String? = nil) {
        self.author_email = author_email
        self.author_id = author_id
        self.author_name = author_name
        self.id = id
        self.image = image
        self.number = number
        self.save_num = save_num
        self.status = status
        self.time = time
        self.title = title
        self.description = description
    }
}
