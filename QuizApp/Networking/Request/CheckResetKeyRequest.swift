//
//  CheckResetKeyRequest.swift
//  QuizApp
//
//  Created by Luong Vu on 5/19/23.
//

import Foundation

enum CheckResetKeyRequest{
    struct Post: BaseRequest{
        var route: APIRoute{
            return APIRoute.checkResetKey__post(param: self)
        }
        let resetKey: String
    }
}
