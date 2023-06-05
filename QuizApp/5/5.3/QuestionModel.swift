//
//  QuestionModel.swift
//  QuizApp
//
//  Created by Luong Vu on 5/30/23.
//

import Foundation

// de bai se yeu cau 1 list questionModel
struct QuestionModel:Codable{
    //var question_id: Int?
    var question_title: String!
    var question_level: Int!
    var question_image: String?
    var question_sort: Int!
    var question_image_url: String?
    var answer_list: [Answer?]
    struct Answer: Codable{
        //var answer_id: Int!
        var content: String!
        var image: String?
        var image_url: String?
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

