//
//  ContentView.swift
//  RemoteConfig
//
//  Created by 이융의 on 4/29/24.
//

import SwiftUI
import Firebase
import FirebaseRemoteConfigSwift

class RemoteConfiguration {
    private var remoteConfig = Firebase.RemoteConfig.remoteConfig()

    init() {
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
    }
    
    private func activate() {
        remoteConfig.activate { changed, error in
            guard error == nil else {
                print("Error activating Remote Config: \(error!.localizedDescription)")
                return
            }
            print("Default values were \(changed ? "" : "NOT ")updated from Remote Config")
        }
    }
    
    func fetchFromServer() async {
        guard let status = try? await remoteConfig.fetch(), status == .success else {
            print("Couldn't fetch Remote Config")
            return
        }
        print("Remote Config successfully fetched")
        activate()
    }
    
    func registerForRealtimeUpdate() {
        
    }
}

struct ContentView: View {
    private var config = RemoteConfiguration()
    @RemoteConfigProperty(key: "screenType", fallback: nil) var screenType: String?
    
    private var image: (name: String, color: Color) {
        if screenType == "screenA" {
            ("a.square", .green)
        } else if screenType == "screenB" {
            ("b.square", .blue)
        } else {
            ("questionmark.square", .red)
        }
    }
    
    var body: some View {
        VStack {
            if screenType != nil {
                Image(systemName: image.name)
                    .foregroundStyle(image.color)
                    .font(.system(size: 250))
            } else {
                ProgressView()
                    .controlSize(.large)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
