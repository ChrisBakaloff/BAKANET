//
//  Posts.swift
//  BAKANET
//
//  Created by Hristiyan Bakalov on 07/05/2021.
//

import Foundation
import FirebaseFirestore

class Posts {
    public var title:String = ""
    public var content:String = ""
    public var likes:Int = 0
    public var posted_by:String?
    
    init(_ title:String , _ content:String , _ likes:Int) {
        self.content = content
        self.title = title
        self.likes = likes
    }
        
    
    static func build(from documents:[QueryDocumentSnapshot])->[Posts]{
        var posts = [Posts]()
        for document in documents{
            posts.append(Posts(document["name"] as! String? ?? "" ,
                               document["content"] as! String? ?? "" ,  12))
        }
        return posts
    }
    
}
