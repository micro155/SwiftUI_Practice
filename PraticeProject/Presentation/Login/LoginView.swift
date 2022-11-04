//
//  LoginView.swift
//  PraticeProject
//
//  Created by 백동열 on 2022/08/07.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.window) var window: UIWindow?
    @State private var appleLoginCoordinator: AppleAuthCoordinator?
    @State private var isLogin = false;
    
    var body: some View {
        
        NavigationView {
            NavigationLink(destination: MainView(), isActive: $isLogin) {
                Button(action: {
                    //            print("Apple Login Button Clicked!")
                    //                isLogin = true
                    appleLogin()
                }) {
                    HStack {
                        Image(systemName: "applelogo")
                            .foregroundColor(.white)
                        Text("Sign in With Apple")
                            .fontWeight(.bold)
                            .font(.title)
                    }
                }
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.black)
            .cornerRadius(10)
        }
        
        
        
        
    }
    
    func appleLogin() {
        appleLoginCoordinator = AppleAuthCoordinator(window: window)
        appleLoginCoordinator?.startAppleLogin()
        
//        isLogin = UserDefaults.standard.bool(forKey: "isLogin")
        isLogin = false
    }
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
