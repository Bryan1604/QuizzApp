//
//  UserModel.swift
//  QuizApp
//
//  Created by Luong Vu on 4/5/23.
//

import Foundation

struct User{
    var id: Int
    var name: String
    var email: String
    var phone_number: String
    var password: String
    var access_token: String
    var year_of_birth: DateFormatter
    var role : Int
    var status: Int
    var reset_key: String
    var reset_expire: DateFormatter
    var avatar: String
    var create_at: Date
    var update_at: Date
    var delete_at: Date
}
