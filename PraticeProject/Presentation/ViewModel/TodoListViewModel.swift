//
//  TodoListViewModel.swift
//  PraticeProject
//
//  Created by 백동열 on 2022/11/19.
//

import Foundation
import UIPilot

class TodoListViewModel: ObservableObject {
    @Published var allTodo: [Todo] = []
        let appPilot: UIPilot<AppRoute>

        init(pilot: UIPilot<AppRoute>) {
            self.appPilot = pilot
            getTodoList()
        }

        func onAddButtonClick() {
            appPilot.push(.Insert)
        }
    
    func deleteTodo(at indexSet: IndexSet) {
        let id = indexSet.map { self.allTodo[$0].id }.first
        if let id = id {
            let delete = TodoDataStore.shared.delete(id: id)
            if delete {
                getTodoList()
            }
        }
    }
    
    func getTodoList() {
        allTodo = TodoDataStore.shared.getAllTodos()
        print("allTodos : \(allTodo)")
    }
}


enum AppRoute: Equatable {
    case List
    case Insert
    case Detail(id: Int64)
}
