//
//  ContentView.swift
//  SwiftNetworkingTutorial
//
//  Created by Sarajit Barmon on 7/11/25.
//

import SwiftUI

struct Post: Codable, Identifiable, HasTitle {
    var id: Int
    var title: String
    var body: String
    var userId: Int
}


protocol HasTitle {
    var title: String { get }
    
}

extension HasTitle {
    
    var getFormattedTitle: String {
        title.uppercased()
    }
}


struct ContentView: View {
    
    private let baseURL = "https://jsonplaceholder.typicode.com/posts"
    
    @State private var posts: [Post] = []
    
    private func fetchPosts() {

        var request = URLRequest(url: URL(string: baseURL)!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print("Error fetching posts: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([Post].self, from: data)
                
                self.posts = decodedData
                
                
            } catch let jsonError {
                print("Error decoding JSON: \(jsonError)")
            }
            
            
        }
        
        task.resume()
        
    }
    

    
    var body: some View {
        VStack {
            
            Text("Posts")
                .font(.title)
                .bold()
           
            List(posts) { post in
                
                HStack(alignment: .top, spacing: 12) {
                    Group {
                        AsyncImage(url: URL(string: "https://picsum.photos/200")!) { img in
                            img.resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                            
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    .frame(width: 56, height: 56)

                    
                    VStack(alignment: .leading) {
                        Text(post.getFormattedTitle)
                            .lineLimit(1)
//                            .truncationMode(.tail)
                            .font(.headline)
                        Text(post.body)
                            .lineLimit(2)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }

                    
                }

            }
        } .onAppear {
            fetchPosts();
        }
        
    }
}

#Preview {
    ContentView()
}
