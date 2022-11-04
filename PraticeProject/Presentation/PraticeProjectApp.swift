//
//  PraticeProjectApp.swift
//  PraticeProject
//
//  Created by 백동열 on 2022/07/30.
//

import SwiftUI
import Firebase

@main
struct PraticeProjectApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
