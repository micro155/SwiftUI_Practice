//
//  TodoItem.swift
//  PraticeProject
//
//  Created by 백동열 on 2022/08/13.
//

import SwiftUI

struct TodoItem: View {
    var item: Todo?
    
    init(_ item: Todo) {
        self.item = item
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct TodoItem_Previews: PreviewProvider {
    static var previews: some View {
        TodoItem(Todo(id: 1, title: "test", date: Date(), content: "testString"))
    }
}
