//
//  ContentView.swift
//  ExpandingLists
//
//  Created by 이융의 on 4/25/24.
//

import SwiftUI

struct ContentView: View {
    let bagContents = [currencies, tools]
    
    var body: some View {
        List(bagContents, children: \.content) { row in
            Label(row.name, systemImage: row.icon)
        }
    }
}

#Preview {
    ContentView()
}
