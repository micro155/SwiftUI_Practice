//
//  TodoInsertViewModel.swift
//  PraticeProject
//
//  Created by 백동열 on 2022/11/20.
//

import Foundation
import UIPilot

class TodoInsertViewModel: ObservableObject {
    
    @Published var title: String = ""
    @Published var startDate: Date = Date()
    @Published var content: String = ""
    
    private let appPilot: UIPilot<AppRoute>
    
    init(pilot: UIPilot<AppRoute>) {
        self.appPilot = pilot
    }
    
    func onAddButtonClick() {
        let id = TodoDataStore.shared.insert(title: title, date: startDate, content: content)
        if id != nil {
            print("id info \(id)")
            appPilot.pop()
        }
    }
}
