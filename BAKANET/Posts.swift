//
//  Posts.swift
//  BAKANET
//
//  Created by Hristiyan Bakalov on 07/05/2021.
//

import Foundation
class Posts {
    public var title:String = ""
    public var content:String = ""
    public var likes:Int = 0
    
    init(_ title:String , _ content:String , _ likes:Int) {
        self.content = content
        self.title = title
        self.likes = likes
    }
    
    func getLikes()->Int{
        return self.likes
    }
    
}
