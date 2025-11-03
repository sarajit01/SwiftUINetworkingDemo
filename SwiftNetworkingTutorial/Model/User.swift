//
//  User.swift
//  SwiftNetworkingTutorial
//
//  Created by Sarajit Barmon on 11/3/25.
//

struct User: Identifiable, HasTitle {
    
    let id: Int
    let username: String
    let name: String
    let title: String
    let phone: String
    let email: String
    let gender: Gender
}

