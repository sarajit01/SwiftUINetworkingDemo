//
//  SingleUserView.swift
//  SwiftNetworkingTutorial
//
//  Created by Sarajit Barmon on 11/3/25.
//

import SwiftUI

struct SingleUserView: View {
    var user: User
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Group {
                AsyncImage(url: URL(string: "\(AppConstants.randomUserPhotoUrl)/\(user.photoPrefix)/\(user.id).jpg")!) { img in
                    img.resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                    
                } placeholder: {
                    ProgressView()
                }
            }
            .frame(width: 56, height: 56)

            
            VStack(alignment: .leading) {
                Text(user.getFormattedTitle)
                    .lineLimit(1)
//                            .truncationMode(.tail)
                    .font(.headline)
                Text(user.email)
                    .lineLimit(2)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(user.phone)
                    .lineLimit(2)
                    .font(.subheadline)
                    .foregroundColor(.secondary)

            }

            
        }

    }
}

#Preview {
    SingleUserView(user: User(id: 1, username: "Puja", name: "Puja Roy", title: "Software Developer" , phone: "01929395645", email: "puja@gmail.com", gender: .Female))
}
