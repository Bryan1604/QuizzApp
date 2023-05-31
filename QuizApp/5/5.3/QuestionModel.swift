//
//  QuestionModel.swift
//  QuizApp
//
//  Created by Luong Vu on 5/30/23.
//

import Foundation

// de bai se yeu cau 1 list questionModel
struct QuestionModel{
    var question_id: Int?
    var question_title: String?
    var answer_list: [Answer]?
    struct Answer{
        var answer_id: Int!
        var content: String?
        var image: String?
        var sort: Int!
        var type: Int!
    }
}

struct InformationModel{
    var user_id: Int?
    var subject_id: Int?
    var title: String?
    var time: Int?
    var number: Int?
    var status: Int?
}

