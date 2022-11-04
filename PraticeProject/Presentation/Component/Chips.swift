//
//  Chip.swift
//  PraticeProject
//
//  Created by 백동열 on 2022/08/14.
//

import SwiftUI

struct Chips: View {
    
    let systemImage: String?
    let title: String
    @State var isSelected: Bool
    
    var body: some View {
        HStack {
            if let imageName = systemImage {
                Image.init(systemName: imageName).font(.title3)
            }
            Text(title).font(.title3).lineLimit(1)
        }.padding(.all, 10)
        .foregroundColor(isSelected ? .white : .blue)
        .background(isSelected ? Color.blue : Color.white)
        .cornerRadius(50)
        .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.blue, lineWidth: 1.5)
        
        ).onTapGesture {
            isSelected.toggle()
        }
    }
}

struct Chips_Previews: PreviewProvider {
    static var previews: some View {
        Chips(systemImage: "checkmark", title: "Work", isSelected: true)
    }
}
