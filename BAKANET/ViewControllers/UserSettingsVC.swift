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

    var userPosts = [Posts]()
    @IBOutlet weak var mainUserNameTextField: UILabel!
    @IBOutlet weak var userTableView: UITableView!
    let fir = Firestore.firestore()
    let auth = FirebaseAuth.Auth.auth()
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userTableView.dataSource = self
        userTableView.delegate = self
//        loadData()
        if(Auth.auth().currentUser != nil){
            DispatchQueue.main.async {
                self.getUserData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.dataLoad {
            self.userTableView.reloadData()
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
    
    
    func dataLoad(completed: @escaping () -> ()){
        fir.collection("Posts").whereField("posted_by", isEqualTo: auth.currentUser?.uid).addSnapshotListener {(querySnapshot , error) in
            guard error == nil else{
                print("An error occured")
                return completed()
             }
            self.userPosts = []
//            for document in querySnapshot!.documents{
//                print(document["content"])
            self.userPosts = Posts.build(from: querySnapshot!.documents)
//            print(self.userPosts[0].title + " " + self.userPosts[0].content)
            
//            }
            completed()
        }
    }
    
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if userPosts.count == 0{
            self.userTableView.setEmptyMessage("Nothing to show here D:")
        }else{
            self.userTableView.restore()
        }
        return userPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userTableView.dequeueReusableCell(withIdentifier: "user_table_cell", for: indexPath) as! UserPostCell
        cell.cellTitleLabel?.text = userPosts[indexPath.row].title
        cell.cellContentLabel?.text = userPosts[indexPath.row].content
        cell.cellLikesLabel?.text = "12"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }

}
