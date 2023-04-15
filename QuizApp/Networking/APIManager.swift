//
//  APIManager.swift
//  QuizApp
//
//  Created by Luong Vu on 4/11/23.
//

import Foundation
import Alamofire

enum APIManager {
    static let session: Session = {
        let configuration = URLSessionConfiguration.default
        return Session(configuration: configuration)
    }()
}


