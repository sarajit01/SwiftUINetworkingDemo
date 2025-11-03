//
//  TabBarView.swift
//  SwiftNetworkingTutorial
//
//  Created by Sarajit Barmon on 11/3/25.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        
        TabView() {
            
            PostsView()
                .toolbarBackground(.visible, for: .tabBar)
                .tabItem {
                    Image(systemName: "house")
                    Text("Posts")
                }
            
            UsersView()
                .toolbarBackground(.visible, for: .tabBar)
                .tabItem {
                    Image(systemName: "person.circle.fill")
                    Text("Users")
                }
        }
        .background(Color(.systemBackground))
        
    }
}

#Preview {
    TabBarView()
}
