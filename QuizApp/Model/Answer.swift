//
//  AnswerList.swift
//  QuizApp
//
//  Created by Luong Vu on 5/1/23.
//

import Foundation

struct Answer: Codable{
    var id_question: Int?
    var id_answer: Int?
    var is_selected: Bool?
}
