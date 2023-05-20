//
//  PostUploadFileRequest.swift
//  QuizApp
//
//  Created by Luong Vu on 5/17/23.
//

import Foundation

enum PostUploadFileRequest{
    struct Post: BaseRequest{
        var route: APIRoute{
            return APIRoute.postUploadFile__post(param: self)
        }
        let user_id: Int
        //let  file: FileManager
        let folder_name: String
        let file_name: String
    }
}
