//
//  User.swift
//  PraticeProject
//
//  Created by 백동열 on 2022/09/10.
//

import Foundation

struct User : Identifiable {
    
    var id: Int
    var name: String
    var email: String
    
    private init(id: Int, name: String, email: String) {
        self.id = id
        self.name = name
        self.email = email
    }
    
}
