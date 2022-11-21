//
//  TodoDataStore.swift
//  PraticeProject
//
//  Created by 백동열 on 2022/11/20.
//

import Foundation
import SQLite

class TodoDataStore {
    
    static let DIR_TODO_DB = "TodoDB"
    static let STORE_NAME = "todo.sqlite3"
    
    private let todos = Table("todos")
    
    private let id = Expression<Int64>("id")
    private let title = Expression<String>("title")
    private let date = Expression<Date>("date")
    private let content = Expression<String>("content")
    
    static let shared = TodoDataStore()
    
    private var db: Connection? = nil
    
    private init() {
        if let docDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let dirPath = docDir.appendingPathComponent(Self.DIR_TODO_DB)
            
            do {
                try FileManager.default.createDirectory(atPath: dirPath.path, withIntermediateDirectories: true, attributes: nil)
                let dbPath = dirPath.appendingPathComponent(Self.STORE_NAME).path
                db = try Connection(dbPath)
                createTable()
                print("SQLiteDataStore init successfully at : \(dbPath)")
            } catch {
                db = nil
                print("SQLiteDataStore init Error : \(error)")
            }
        } else {
            db = nil
        }
    }
    
    private func createTable() {
        guard let database = db else {
            return
        }
        
        do {
            try database.run(todos.create { table in
                table.column(id, primaryKey: .autoincrement)
                table.column(title)
                table.column(date)
                table.column(content)
            })
            print("Table Created")
        } catch {
            print(error)
        }
    }
    
    func insert(title: String, date: Date) -> Int64? {
        guard let database = db else { return nil }

        let insert = todos.insert(self.title <- title,
                                  self.date <- date,
                                  self.content <- content)
        do {
            let rowID = try database.run(insert)
            return rowID
        } catch {
            print(error)
            return nil
        }
    }
    
    func getAllTodos() -> [Todo] {
        var todos: [Todo] = []
        guard let database = db else { return [] }
        
        do {
            for todo in try database.prepare(self.todos) {
                todos.append(Todo(id: todo[id], title: todo[title], date: todo[date], content: todo[content]))
            }
        } catch {
            print(error)
        }
        
        return todos
    }
    
    func findTask(todoId: Int64) -> Todo? {
        var todo: Todo = Todo(id: todoId, title: "", date: Date(), content: "")
        guard let database = db else { return nil }

        let filter = self.todos.filter(id == todoId)
        do {
            for t in try database.prepare(filter) {
                todo.title = t[title]
                todo.date = t[date]
                todo.content = t[content]
            }
        } catch {
            print(error)
        }
        return todo
    }
    
    func update(id: Int64, title: String, date: Date = Date(), content: String) -> Bool {
        guard let database = db else { return false }

        let todo = todos.filter(self.id == id)
        do {
            let update = todo.update([
                self.title <- title,
                self.date <- date,
                self.content <- content
            ])
            if try database.run(update) > 0 {
                return true
            }
        } catch {
            print(error)
        }
        return false
    }
    
    func delete(id: Int64) -> Bool {
        guard let database = db else {
            return false
        }
        do {
            let filter = todos.filter(self.id == id)
            try database.run(filter.delete())
            return true
        } catch {
            print(error)
            return false
        }
    }
}
