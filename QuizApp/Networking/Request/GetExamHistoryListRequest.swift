//
//  getExamHistoryList.swift
//  QuizApp
//
//  Created by Luong Vu on 5/9/23.
//

import Foundation

enum GetExamHistoryListRequest{
    struct Post: BaseRequest{
        var route: APIRoute{
            return APIRoute.getExamHistoryList__post(param: self)
        }
        let user_id: Int
        let sort_field: Int?
        let sort_by : String?
        let limit: Int
        let offset: Int
    }
}
