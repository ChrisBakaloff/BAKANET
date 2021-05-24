//
//  UserSettingsVC.swift
//  BAKANET
//
//  Created by Hristiyan Bakalov on 07/05/2021.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class UserPostCell: UITableViewCell {

    @IBOutlet weak var cellTitleLabel: UILabel!
    @IBOutlet weak var cellContentLabel: UILabel!
    @IBOutlet weak var cellLikesLabel: UILabel!
    
}

class UserSettingsVC: UIViewController, UITableViewDelegate , UITableViewDataSource{


    @IBOutlet weak var mainUserNameTextField: UILabel!
    @IBOutlet weak var userTableView: UITableView!
    let fir = Firestore.firestore()
    let auth = FirebaseAuth.Auth.auth()
    
    
    private var service: PostService?
    
    private var allposts = [appPosts](){
        didSet{
            DispatchQueue.main.async {
                self.userposts = self.allposts
            }
        }
    }
    private var  userposts = [appPosts](){
        didSet{
            DispatchQueue.main.async {
                self.userTableView.reloadData()
            }
        }
    }

    
    func loadData(){
        service =  PostService()
        service?.get(collectionID: "Posts")  {posts in
            self.allposts = self.userposts
            }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userTableView.dataSource = self
        userTableView.delegate = self
        loadData()
        if(Auth.auth().currentUser != nil){
            DispatchQueue.main.async {
                self.getUserData()
            }
        }
        
    }
    
    
    //MARK: IBAction functions
    @IBAction func logUserOut(_ sender: RoundedBakaButton) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "logout.to.main", sender: nil)
        } catch {
            print("User already logged out")
        }
    }
    
    //MARK: Functions
    func getUserData(){
        fir.collection("Users").document(auth.currentUser!.uid).getDocument(completion: {(document, error) in
            if let  doc = document{
                let fname = doc.get("fname") as! String
                let lname = doc.get("lname") as! String
                self.mainUserNameTextField.text =  fname + " " + lname
            }
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userposts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userTableView.dequeueReusableCell(withIdentifier: "user_table_cell", for: indexPath) as! UserPostCell
//        
        cell.cellTitleLabel?.text = userposts[indexPath.row].postHeading
        cell.cellContentLabel?.text = userposts[indexPath.row].postHeading
        cell.cellLikesLabel?.text = "12"
        cell.cellTitleLabel.layer.cornerRadius = 10
        cell.cellTitleLabel.clipsToBounds = true
        cell.cellTitleLabel.backgroundColor = UIColor.white.withAlphaComponent(0.4)
//        cell.postContentLabel?.text = posts[indexPath.row].content
//        cell.likesLabel?.text = String(posts[indexPath.row].likes)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    


    
    
    

    
//    func getPostsForUser(){
//        let postRef = fir.collection("Posts")
//        var posts = postRef.whereField("posted_by", isEqualTo: auth.currentUser?.uid).getDocuments(completion: {(document, error) in
//            if let document = document , !document.isEmpty {
//
//            }
//        })
//
//    }


}
