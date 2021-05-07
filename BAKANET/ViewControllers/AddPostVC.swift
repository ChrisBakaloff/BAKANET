//
//  AddPostVC.swift
//  BAKANET
//
//  Created by Hristiyan Bakalov on 07/05/2021.
//

import UIKit

class AddPostVC: UIViewController {

    @IBOutlet weak var goBackButton: UIButton!
    @IBOutlet weak var goNextButton: UIButton!
    @IBOutlet weak var postHeadingTextField: UITextField!
    @IBOutlet weak var postContentTextField: UITextView!
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
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        print("prepare hit")
//        if (postHeadingTextField.text != nil && postContentTextField.text != nil){
//            let postTitle = postHeadingTextField.text
//            let postContent = postContentTextField.text
//            posts.insert(Posts(postTitle!, postContent!, 0), at: 0);
//            
//        }
//        else{
//            return
//        }
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
