//
//  FirstViewController.swift
//  BAKANET
//
//  Created by Hristiyan Bakalov on 08/05/2021.
//

import UIKit
import FirebaseAuth

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        if Auth.auth().currentUser != nil{
            performSegue(withIdentifier:"start.to.main" , sender: nil)
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
