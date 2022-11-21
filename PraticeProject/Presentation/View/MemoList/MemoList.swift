//
//  MemoList.swift
//  PraticeProject
//
//  Created by 백동열 on 2022/08/07.
//

import SwiftUI

struct MemoList: View {
    
    var list: [Memo] = []
    var chipList: [String] = []
    
    init()
    {
        for i in 1...15 {
            list.append(Memo(title: "title\(i)", content: "Content"))
        }
        
        for i in 1...15 {
            chipList.append("title\(i)")
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Memo List")
                .font(.system(size: 30, weight: .bold))
                .padding(5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top) {
                    ForEach (chipList, id: \.self) { chip in
                        Chips(systemImage: nil, title: chip, isSelected: true)
                    }
                }
            }.frame(height: 50)
            
            List(list) { item in
                HStack {
                    Text("\(item.title)")
                    Spacer()
                    Text("\(item.content)")
                }
            }.listStyle(.plain)
            
        }.background(Color.white)
    }
}

struct MemoList_Previews: PreviewProvider {
    static var previews: some View {
        MemoList()
    }
}
