//
//  BaseResponse.swift
//  QuizApp
//
//  Created by Luong Vu on 4/11/23.
//

import Foundation

protocol BaseResponse: Codable{
    var statusCode: Int? {get}
    var message: String? {get}
}
