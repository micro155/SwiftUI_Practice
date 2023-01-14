//
//  TodoList.swift
//  PraticeProject
//
//  Created by 백동열 on 2022/08/07.
//

import SwiftUI

struct TodoListView: View {
    
    @ObservedObject var viewModel: TodoListViewModel
    
    var body: some View {
        ZStack {
            VStack(spacing: 30) {
                
                List {
                    if viewModel.allTodo.isEmpty {
                        Text("Todo 목록이 없습니다.")
                    } else {
                        ForEach(viewModel.allTodo, id: \.id) { todo in
                            Text(todo.title)
                                .onTapGesture {
                                    viewModel.appPilot.push(.Detail(id: todo.id))
                                }
                        }
                        .onDelete(perform: viewModel.deleteTodo(at:))
                    }
                    
                }
                
                .listStyle(.plain)
                .onAppear {
                    viewModel.getTodoList()
                    UITableView.appearance().backgroundColor = .clear
                    UITableViewCell.appearance().selectionStyle = .none
                    UITableView.appearance().showsVerticalScrollIndicator = false
                }
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        viewModel.onAddButtonClick()
                    }) {
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.white)
                            .padding(20)
                    }
                    .background(Color.blue)
                    .cornerRadius(.infinity)
                    .padding()
                }
            }
        }.navigationTitle("Todo List")
    }
}

//struct TodoListView_Previews: PreviewProvider {
//    static var previews: some View {
//        TodoListView()
//    }
//}
