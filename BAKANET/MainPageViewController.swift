//
//  MainPageViewController.swift
//  BAKANET
//
//  Created by Hristiyan Bakalov on 26/04/2021.
//

import UIKit

class PostCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var postContentLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    
}

class MainPageViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    

    
    var posts:[Posts] = []


    @IBOutlet weak var tableV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        posts.append(Posts("Why are you running ?", "Just Saw a man running", 12))
        posts.append(Posts("Why are you running ?", "Just Saw a man running", 12))
        posts.append(Posts("Why are you running ?", "Just Saw a man running", 12))
//        self.tableV.register(PostCell.self, forCellReuseIdentifier: "table_cell")
        tableV.dataSource = self
        tableV.delegate = self
        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "table_cell", for: indexPath) as! PostCell
        cell.titleLabel?.text = posts[indexPath.row].title
        cell.postContentLabel?.text = posts[indexPath.row].content
        cell.likesLabel?.text = String(posts[indexPath.row].likes)
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(posts[indexPath.row].getLikes())
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
