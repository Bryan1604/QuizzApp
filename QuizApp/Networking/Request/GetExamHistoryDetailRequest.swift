//
//  GetExamHistoryDetail,.swift
//  QuizApp
//
//  Created by Luong Vu on 5/10/23.
//

import Foundation

enum GetExamHistoryDetailRequest{
    struct Get: BaseRequest{
        var route: APIRoute{
            return APIRoute.getExamHistoryDetail__get(param: self)
        }
        let user_id: Int
        let exam_history_id: Int?
    }
}
