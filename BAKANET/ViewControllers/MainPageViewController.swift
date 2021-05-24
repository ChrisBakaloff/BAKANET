//
//  MainPageViewController.swift
//  BAKANET
//
//  Created by Hristiyan Bakalov on 26/04/2021.
//

import UIKit
import FirebaseAuth

class PostCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var postContentLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    
}

//var posts:[Posts] = []
//posts.append(Posts("Why are you running ?", "Just Saw a man running", 12))




class MainPageViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {

//MARK: OUTLETS
    @IBOutlet weak var addPostButton: UIButton!
    @IBOutlet weak var tableV: UITableView!
    
    
//MARK: FIREBASE FUNCTIONS
    private var service: PostService?
    
    private var allposts = [appPosts](){
        didSet{
            DispatchQueue.main.async {
                self.posts = self.allposts
            }
        }
    }
    private var  posts = [appPosts](){
        didSet{
            DispatchQueue.main.async {
                self.tableV.reloadData()
            }
        }
    }

    
    func loadData(){
        service =  PostService()
        service?.get(collectionID: "Posts")  {posts in
            self.allposts = posts
            }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPostButton.clipsToBounds = true
        addPostButton.frame.size.width = addPostButton.frame.size.height
        addPostButton.layer.cornerRadius = addPostButton.frame.size.width / 2
        addPostButton.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        tableV.dataSource = self
        tableV.delegate = self
        loadData()

    }
    
//MARK: Segue
    
    @IBAction func cancel(_ unwindSegue: UIStoryboardSegue) {}
    @IBAction func backAndSendPost(_ unwindSegue: UIStoryboardSegue) {
        // Use data from the view controller which initiated the unwind segue
        guard let LandingVC = unwindSegue.source as? AddPostVC else {return}
        if LandingVC.postContentTextField.text != "" || LandingVC.postHeadingTextField.text != ""{
//            posts.insert(Posts(LandingVC.postHeadingTextField.text!, LandingVC.postContentTextField.text!, 0), at: 0)
            tableV.reloadData()
        }else{
            return
        }
        
    }

//MARK: TableView Functions

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {        
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "table_cell", for: indexPath) as! PostCell
//        cell.titleLabel?.text = posts[indexPath.row].title
        cell.titleLabel?.text = posts[indexPath.row].postHeading
        cell.postContentLabel?.text = posts[indexPath.row].postHeading
        cell.likesLabel?.text = String(10)
        cell.titleLabel.layer.cornerRadius = 10
        cell.titleLabel.clipsToBounds = true
        cell.titleLabel.backgroundColor = UIColor.white.withAlphaComponent(0.4)
//        cell.postContentLabel?.text = posts[indexPath.row].content
//        cell.likesLabel?.text = String(posts[indexPath.row].likes)
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(posts[indexPath.row].getLikes())
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
