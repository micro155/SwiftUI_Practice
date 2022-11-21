//
//  MainView.swift
//  PraticeProject
//
//  Created by 백동열 on 2022/08/07.
//

import SwiftUI
import UIPilot

struct MainView: View {
    
    private let pilot: UIPilot<AppRoute>
    
    init() {
        pilot = .init(initial: .List)
    }
    
    var body: some View {
        TabView {
            Home()
                .tag("Home")
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            TodoListView(viewModel: TodoListViewModel(pilot: pilot))
                .tag("TodoList")
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Todo")
                }
            MemoList()
                .tag("MemoList")
                .tabItem {
                    Image(systemName: "note.text")
                    Text("Memo")
                }
        }
        .onAppear {
            let appearance = UITabBarAppearance()
            appearance.backgroundColor = UIColor(Color.orange.opacity(0.2))
            
            UITabBar.appearance().standardAppearance = appearance
            //            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
