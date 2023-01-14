//
//  TodoInsertView.swift
//  PraticeProject
//
//  Created by 백동열 on 2022/11/20.
//

import SwiftUI

struct TodoInsertView: View {

    @ObservedObject var viewModel: TodoInsertViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

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
                    viewModel.onAddButtonClick()
                }) {
                    Text("Add")
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
        }.navigationTitle("Create Todo")
    }
}
