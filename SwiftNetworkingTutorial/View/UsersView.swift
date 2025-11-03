//
//  UsersView.swift
//  SwiftNetworkingTutorial
//
//  Created by Sarajit Barmon on 11/3/25.
//

import SwiftUI

struct UsersView: View {
    
    @State private var users: [User] = [
        User(id: 1, username: "Rakesh", name: "rakesh@gmail.com", title: "CEO at SoftCore IT", phone: "014334343434", email: "rakesh@gmail.com", gender: .Male) ,
        
        User(id: 2, username: "Laila", name: "laila@gmail.com", title: "System Designer", phone: "014334343434", email: "laila@gmail.com", gender: .Female) ,
        
        User(id: 3, username: "Anonya", name: "anonya@gmail.com", title: "App Developer", phone: "014334773434", email: "ananya@gmail.com", gender: .Female) ,
        
    ]
    
    
    
    var body: some View {
        VStack {
            
            Text("Users")
                .font(.title)
                .bold()
            
            List(users) { user in
                
                SingleUserView(user: user)
                
            }
        }
    }
}

#Preview {
    UsersView()
}
