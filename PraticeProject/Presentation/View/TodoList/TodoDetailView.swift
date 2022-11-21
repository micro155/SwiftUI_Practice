//
//  TodoDetailView.swift
//  PraticeProject
//
//  Created by 백동열 on 2022/11/20.
//

import SwiftUI

struct TaskDetailView: View {

    @ObservedObject var viewModel: TodoDetailViewModel
    var status = ["Completed", "Incomplete"]

    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Text("Task Name : ")
                TextField("Task Name", text: $viewModel.todoTitle)
                    .textFieldStyle(.roundedBorder)
            }

            HStack(spacing: 20) {
                Text("Approx Date :")
                DatePicker("", selection: $viewModel.todoDate)
                Spacer()
            }

            HStack {
                Text("Status        :   ")
                Picker("What is your favorite color?", selection: $viewModel.content) {
                    ForEach(status, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                Spacer()
            }

            HStack {
                Button(action: {
                    viewModel.onUpdateClick()
                }) {
                    Text("Update")
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
        .padding(.horizontal)
    }
}
