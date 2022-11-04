//
//  Todo.swift
//  PraticeProject
//
//  Created by 백동열 on 2022/08/13.
//

import Foundation

class Todo : Identifiable {
    var title: String
    var content: String
    
    init(title: String, content: String) {
        self.title = title
        self.content = content
    }
}
