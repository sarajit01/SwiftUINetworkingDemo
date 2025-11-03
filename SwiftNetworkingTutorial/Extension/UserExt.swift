//
//  UserExt.swift
//  SwiftNetworkingTutorial
//
//  Created by Sarajit Barmon on 11/3/25.
//


enum Gender: String, CaseIterable {
    case Male, Female
}

extension User {
    var photoPrefix: String {
        switch self.gender {
        case .Male :
            "men"
            
        case .Female :
            "women"
            
        default:
            "men"
        }
        
    }
}
