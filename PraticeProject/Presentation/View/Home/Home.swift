//
//  Home.swift
//  PraticeProject
//
//  Created by 백동열 on 2022/08/07.
//

import SwiftUI

struct Home: View {
    
    var list: [Todo] = []
    
    init()
    {
//        for i in 1...15 {
//            list.append(Todo(id: 1, title: "title\(i)", date: Date(), content: "Content"))
//        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Recently Todo")
                .font(.system(size: 30, weight: .bold))
                .padding(5)
            
//            List(list) { item in
//                HStack {
//                    Text("\(item.title)")
//                    Spacer()
//                    Text("\(item.content)")
//                }
//            }.listStyle(.plain)
            
        }.background(Color.white)
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
