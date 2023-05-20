//
//  SavedDepartment.swift
//  QuizApp
//
//  Created by Luong Vu on 5/10/23.
//

import Foundation

enum SavedDepartmentRequest{
    struct Post: BaseRequest{
        var route: APIRoute{
            return APIRoute.savedDepartment__post(param: self)
        }
        let user_id: Int

    }
}
