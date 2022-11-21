//
//  TodoInsertView.swift
//  PraticeProject
//
//  Created by 백동열 on 2022/11/20.
//

import SwiftUI

struct TodoInsertView: View {

    @ObservedObject var viewModel: TodoInsertViewModel

    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Text("Todo title : ")
                TextField("Todo title", text: $viewModel.title)
                    .textFieldStyle(.roundedBorder)
            }
            .padding()

            HStack(spacing: 20) {
                Text("Start Date  :")
                DatePicker("", selection: $viewModel.startDate)
                Spacer()
            }
            .padding()
            
            HStack(spacing: 20) {
                Text("Todo content : ")
                TextField("Todo content", text: $viewModel.content)
                    .textFieldStyle(.roundedBorder)
            }
            .padding()

            HStack {
                Button(action: {
                    viewModel.onAddButtonClick()
                }) {
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 30)
                }
                .background(Color.blue)
                .cornerRadius(.infinity)
                .padding()
            }
            Spacer()
        }
    }
}
