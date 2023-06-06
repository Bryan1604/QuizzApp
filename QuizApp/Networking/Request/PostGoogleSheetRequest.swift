//
//  PostGoogleSheetRequest.swift
//  QuizApp
//
//  Created by Luong Vu on 6/5/23.
//

import Foundation

enum PostGoogleSheetRequest{
    struct Post: BaseRequest{
        var route: APIRoute{
            return APIRoute.postGoogleSheet__post(param: self)
        }
        let user_id: Int
        let google_sheet_url: String
    }
}
