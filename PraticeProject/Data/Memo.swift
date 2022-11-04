//
//  Book.swift
//  PraticeProject
//
//  Created by 백동열 on 2022/08/05.
//

import Foundation


class Memo : Identifiable {
    var title: String
    var content: String
//    var date: Date
    
    init(title: String, content: String) {
        self.title = title
        self.content = content
//        self.date = date
    }
}
