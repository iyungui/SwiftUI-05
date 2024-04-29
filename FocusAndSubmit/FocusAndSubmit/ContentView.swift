//
//  ContentView.swift
//  FocusAndSubmit
//
//  Created by 이융의 on 4/26/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TextField("Address", text: $)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
