//
//  TodoDetailViewModel.swift
//  PraticeProject
//
//  Created by 백동열 on 2022/11/20.
//

import Foundation
import UIPilot

class TodoDetailViewModel: ObservableObject {
    
    var id: Int64
    var todo: Todo?
    
    @Published var todoTitle: String = ""
    @Published var todoDate: Date = Date()
    @Published var content: String = ""
    
    private let appPilot: UIPilot<AppRoute>
    
    init(id: Int64, pilot: UIPilot<AppRoute>) {
        self.id = id
        self.appPilot = pilot
        getTodo()
    }
    
    func getTodo() {
        todo = TodoDataStore.shared.findTodo(todoId: id)
        todoTitle = todo?.title ?? ""
        todoDate = todo?.date ?? Date()
        content = todo?.content ?? ""
    }
    
    func onUpdateClick() {
        let statusUpdated = TodoDataStore.shared.update(id: id, title: todoTitle, date: todoDate, content: content)
        if statusUpdated {
            appPilot.pop()
        }
    }
    
}
