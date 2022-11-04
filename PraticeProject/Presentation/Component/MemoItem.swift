//
//  MemoItem.swift
//  PraticeProject
//
//  Created by 백동열 on 2022/08/13.
//

import SwiftUI

struct MemoItem: View {
    var item: Memo?
    
    init(_ item: Memo) {
        self.item = item
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MemoItem_Previews: PreviewProvider {
    static var previews: some View {
        MemoItem(Memo(title: "test", content: "testString"))
    }
}
