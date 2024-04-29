//
//  ContentView.swift
//  FormFieldDisable
//
//  Created by 이융의 on 4/26/24.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            Text("Dungeons and Wagons")
                .fontWeight(.heavy)
                .foregroundStyle(.blue)
                .font(.largeTitle)
                .padding(.bottom, 30)
                
            Image(systemName: "person.circle")
                .font(.system(size: 150))
                .foregroundStyle(.gray)
                .padding(.bottom, 40)
            
            Group {
                TextField("Username", text: $username)
                
                Group {
                    TextField("Username", text: $username)
                    SecureField("Password", text: $password)
                }
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 2))
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
