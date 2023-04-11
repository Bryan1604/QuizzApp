//
//  BaseRequest.swift
//  QuizApp
//
//  Created by Luong Vu on 4/11/23.
//

import Foundation

protocol BaseRequest: Codable{
    var route: APIRoute{get}
}

enum APIPath: String{
    case login = "/login"
}
