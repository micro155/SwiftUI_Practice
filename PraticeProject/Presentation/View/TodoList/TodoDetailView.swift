//
//  TodoDetailView.swift
//  PraticeProject
//
//  Created by 백동열 on 2022/11/20.
//

import SwiftUI

struct TodoDetailView: View {

    @ObservedObject var viewModel: TodoDetailViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Text("Todo Title : ")
                TextField("Todo Title", text: $viewModel.todoTitle)
                    .textFieldStyle(.roundedBorder)
            }

            HStack(spacing: 20) {
                Text("Date :")
                DatePicker("", selection: $viewModel.todoDate)
                Spacer()
            }

            HStack {
                Text("content        :   ")
                TextField("Todo Content", text: $viewModel.content)
                    .textFieldStyle(.roundedBorder)
                Spacer()
            }

            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Cancel")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 30)
                }
                .background(Color.blue)
                .cornerRadius(.infinity)
                .padding()
                Button(action: {
                    viewModel.onUpdateClick()
                }) {
                    Text("Update")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 30)
                }
                .background(Color.green)
                .cornerRadius(.infinity)
                .padding(.horizontal, 10)
            }
            Spacer()
        }
        .navigationTitle("Todo Details")
        .padding(.horizontal)
    }
}
