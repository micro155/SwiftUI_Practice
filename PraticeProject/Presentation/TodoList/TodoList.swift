//
//  TodoList.swift
//  PraticeProject
//
//  Created by 백동열 on 2022/08/07.
//

import SwiftUI

struct TodoList: View {
    
    var todoList: [Todo] = []
    var chipList: [String] = []
    
    init()
    {
        for i in 1...15 {
            todoList.append(Todo(title: "title\(i)", content: "Content"))
        }
        
        for i in 1...15 {
            chipList.append("title\(i)")
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Todo List")
                .font(.system(size: 30, weight: .bold))
                .padding(5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top) {
                    ForEach (chipList, id: \.self) { chip in
                        Chips(systemImage: nil, title: chip, isSelected: true)
                    }
                }
            }.frame(height: 50)
            
            List(todoList) { item in
                HStack {
                    Text("\(item.title)")
                    Spacer()
                    Text("\(item.content)")
                }
            }.listStyle(.plain)
            
        }.background(Color.white)
    }
}

struct TodoList_Previews: PreviewProvider {
    static var previews: some View {
        TodoList()
    }
}
