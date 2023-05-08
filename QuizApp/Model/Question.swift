//
//  Question.swift
//  QuizApp
//
//  Created by Luong Vu on 4/24/23.
//

import Foundation

class Question{
    var question_id: Int?
    var question_title: String?
    var question_image: String?
    var question_level: Int?
    var question_sort: Int?
    var answerList: [Answer]?
    
    struct Answer{
        var answer_id: Int?
        var content: String?
        var image: String?
        var sort: Int?
        var type: Int?
    }
    
    init(question_id: Int? = nil, question_title: String? = nil, question_image: String? = nil, question_level: Int? = nil, question_sort: Int? = nil, answerList: [Answer]? = nil) {
        self.question_id = question_id
        self.question_title = question_title
        self.question_image = question_image
        self.question_level = question_level
        self.question_sort = question_sort
        self.answerList = answerList
    }
}


