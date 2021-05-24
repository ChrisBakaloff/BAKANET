//
//  PostsService.swift
//  BAKANET
//
//  Created by Hristiyan Bakalov on 11/05/2021.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth


class PostService{
    let database = Firestore.firestore()
    let auth = FirebaseAuth.Auth.auth()
    func get(collectionID: String, handler: @escaping ([appPosts]) -> Void) {
            database.collection("Posts")
                .addSnapshotListener { querySnapshot, err in
                    if let error = err {
                        print(error)
                        handler([])
                    } else {
                        handler(appPosts.build(from: querySnapshot?.documents ?? []))
                    }
                }
        }
    
    func getForUser(collectionID: String, handler: @escaping ([appPosts]) -> Void) {
        database.collection("Posts").whereField("posted_by", isEqualTo: auth.currentUser?.uid )
                .addSnapshotListener { querySnapshot, err in
                    if let error = err {
                        print(error)
                        handler([])
                    } else {
                        handler(appPosts.build(from: querySnapshot?.documents ?? []))
                    }
                }
        }
}
