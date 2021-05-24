//
//  postsStruct.swift
//  BAKANET
//
//  Created by Hristiyan Bakalov on 11/05/2021.
//

import Foundation
import FirebaseFirestore


struct appPosts{
    let postHeading: String?
    let postContent: String?
    let postedBy: String?
    
    static func build(from documents:[QueryDocumentSnapshot])->[appPosts]{
        var posts = [appPosts]()
        for document in documents{
            posts.append(appPosts(postHeading: document["name"] as! String? ?? "" ,
                                  postContent: document["content"] as! String? ?? "" ,  postedBy: document["posted_by"] as! String?  ?? ""))
        }
        return posts
    }
}

