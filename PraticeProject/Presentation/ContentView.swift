//
//  ContentView.swift
//  PraticeProject
//
//  Created by 백동열 on 2022/07/30.
//

import SwiftUI
import UIPilot


struct ContentView: View {
    
    private let pilot: UIPilot<AppRoute>
    
    init() {
        pilot = .init(initial: .List)
    }
    
    var body: some View {
        Group {
            UIPilotHost(pilot) { route in
                switch route {
                case .List:
                    
                    TodoListView(viewModel: TodoListViewModel(pilot: pilot))
                    
                case .Insert:
                    
                    TodoInsertView(viewModel: TodoInsertViewModel(pilot: pilot))
                    
                case .Detail(let id):
                    
                    TodoDetailView(viewModel: TodoDetailViewModel(id: id, pilot: pilot))
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
