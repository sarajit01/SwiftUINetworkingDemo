//
//  PostsView.swift
//  SwiftNetworkingTutorial
//
//  Created by Sarajit Barmon on 11/3/25.
//

import SwiftUI

struct PostsView: View {
    
    @Environment(PostViewModel.self) private var viewModel
    
    @State private var isLoading: Bool = false

    var body: some View {
        ZStack {
            if isLoading {
                ProgressView()
            } else {
                VStack {
                    
                    Text("Posts")
                        .font(.title)
                        .bold()
                    
                    List(viewModel.posts) { post in
                        
                        SinglePostView(post: post)
                        
                    }
                }
                
            }
            
        }
        .onAppear {
           Task {
               isLoading = true
               
               defer {
                   isLoading = false
               }
               try await viewModel.fetchPosts()
           }
       }
                
    }
}

#Preview {
    PostsView()
}
