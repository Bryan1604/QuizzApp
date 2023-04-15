//
//  Extension.swift
//  QuizApp
//
//  Created by Luong Vu on 4/11/23.
//

import Foundation

extension Encodable{
    var dictionary: [String:Any]{
        let encoder = JSONEncoder()
        return (try? JSONSerialization.jsonObject(with: encoder.encode(self))) as? [String: Any] ?? [:]
    }
}
