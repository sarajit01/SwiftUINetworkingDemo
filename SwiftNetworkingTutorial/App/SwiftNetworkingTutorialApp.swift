//
//  SwiftNetworkingTutorialApp.swift
//  SwiftNetworkingTutorial
//
//  Created by Sarajit Barmon on 7/11/25.
//

import SwiftUI

@main
struct SwiftNetworkingTutorialApp: App {
    
    
    @State private var postViewModel = PostViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(postViewModel)
        }
    }
}
