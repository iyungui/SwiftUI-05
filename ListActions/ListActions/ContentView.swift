//
//  ContentView.swift
//  ListActions
//
//  Created by Jungman Bae on 4/24/24.
//

import SwiftUI

struct ContentView: View {
    @State var numbers = [1,2,3,4]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(numbers, id: \.self) { number in
                    Text("\(number)")
                }
            }
            .navigationTitle("Number List")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Add") {
                    addItemToRow()
                }
            }
        }
    }
    
    private func addItemToRow() {
        numbers.append(Int.random(in: 5..<100))
    }
}

#Preview {
    ContentView()
}
