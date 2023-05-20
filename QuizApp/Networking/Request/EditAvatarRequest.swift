//
//  EditAvatarRequest.swift
//  QuizApp
//
//  Created by Luong Vu on 5/15/23.
//

import Foundation

enum EditAvatarRequest{
    struct Post: BaseRequest{
        var route: APIRoute{
            return APIRoute.editAvatar__post(param: self)
        }
        let user_id: Int
        let file: URL
    }
}
