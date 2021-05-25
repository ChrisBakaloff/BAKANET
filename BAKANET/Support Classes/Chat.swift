//
//  Chat.swift
//  BAKANET
//
//  Created by Hristiyan Bakalov on 25/05/2021.
//

import Foundation
struct Chat {
    var users: [String]
    var dictionary: [String: Any]{
        return ["users": users]
    }
    
}

extension Chat{
    init?(dictionary: [String: Any]){
        guard let chatUser  = dictionary["users"] as? [String] else {return nil}
        self.init(users: chatUser)
    }
}
