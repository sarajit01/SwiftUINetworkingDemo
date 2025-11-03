//
//  SinglePostView.swift
//  SwiftNetworkingTutorial
//
//  Created by Sarajit Barmon on 11/3/25.
//

import SwiftUI

struct SinglePostView: View {
    
    var post: Post
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Group {
                AsyncImage(url: URL(string: AppConstants.randomPhotosURL)!) { img in
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
}
