//
//  Post.swift
//  SwiftNetworkingTutorial
//
//  Created by Sarajit Barmon on 11/3/25.
//

import Foundation
struct Post: Codable, Identifiable, HasTitle {
    var id: Int
    var title: String
    var body: String
    var userId: Int
}
