//
//  PostViewModel.swift
//  SwiftNetworkingTutorial
//
//  Created by Sarajit Barmon on 11/3/25.
//

import Foundation

@Observable
@MainActor
class PostViewModel {
    
    var posts: [Post] = []
    
    func fetchPosts() async throws {
        
        var request = URLRequest(
            url: URL(
                string: AppConstants.postsURL
            )!
        )
        request.httpMethod = "GET"
        request
            .setValue(
                "application/json",
                forHTTPHeaderField: "Content-Type"
            )
        let task = URLSession.shared.dataTask(
            with: request
        ) {
            data,
            response,
            error in
            
            if let error = error {
                print(
                    "Error fetching posts: \(error)"
                )
                return
            }
            
            guard let data = data else {
                print(
                    "No data received"
                )
                
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(
                    [Post].self,
                    from: data
                )
                
                self.posts = decodedData
                
                
            } catch let jsonError {
                print(
                    "Error decoding JSON: \(jsonError)"
                )
            }
            
            
        }
        
        task
            .resume()
        
    }
    
    
}
