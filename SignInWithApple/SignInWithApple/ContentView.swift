//
//  ContentView.swift
//  SignInWithApple
//
//  Created by 이융의 on 4/29/24.
//

import SwiftUI
import AuthenticationServices

struct ContentView: View {
    @State private var userName: String = ""
    @State private var userEmail: String = ""
    
    var body: some View {
        ZStack {
            Color.white
            
            if userName.isEmpty {
                SignInWithAppleButton(
                    .signIn, onRequest: onRequest, onCompletion: onCompletion
                )
                .signInWithAppleButtonStyle(.black)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .padding(.horizontal)
                
            } else {
                Text("Welcome\n\(userName), \(userEmail)")
                    .font(.headline)
            }
        }
    }
    
    private func onRequest(_ request: ASAuthorizationAppleIDRequest) {
        request.requestedScopes = [.fullName, .email]
    }
    
    private func onCompletion(_ request: Result<ASAuthorization, Error>) {
        switch request {
        case .success(let authResult):
            guard let credential = authResult.credential as? ASAuthorizationAppleIDCredential
            else { return }
                // MARK: - Store Data
            
        case .failure(let error):
            print("Authorization failed: " + error.localizedDescription)
        }
    }
}

#Preview {
    ContentView()
}
