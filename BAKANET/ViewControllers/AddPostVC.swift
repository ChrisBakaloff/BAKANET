//
//  AddPostVC.swift
//  BAKANET
//
//  Created by Hristiyan Bakalov on 07/05/2021.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class AddPostVC: UIViewController {
    
    private var db = Firestore.firestore()

    @IBOutlet weak var goBackButton: UIButton!
    @IBOutlet weak var goNextButton: UIButton!
    @IBOutlet weak var postHeadingTextField: UITextField!
    @IBOutlet weak var postContentTextField: UITextView!
    let userid = Auth.auth().currentUser?.uid
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goBackButton.clipsToBounds = true
        goNextButton.clipsToBounds = true
        goBackButton.layer.cornerRadius = 12
        goNextButton.layer.cornerRadius = 12
        goBackButton.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        goNextButton.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        
        
        // Do any additional setup after loading the view.
    }
    func randomString() -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<12).map{ _ in letters.randomElement()! })
    }

    func addPostToDb(){
        db.collection("Posts").document(randomString()).setData([
            "content": postHeadingTextField.text ?? "",
            "name": postContentTextField.text ?? "",
            "posted_by": userid ?? ""
        ])
        print(userid!)
    }
    @IBAction func onNextClick(_ sender: UIButton) {
        addPostToDb()
    }
}
