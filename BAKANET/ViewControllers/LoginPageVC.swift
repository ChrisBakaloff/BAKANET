//
//  LoginPageVC.swift
//  BAKANET
//
//  Created by Hristiyan Bakalov on 08/05/2021.
//

import UIKit

class LoginPageVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func otLoginButtonPress(_ sender: RoundedBakaButton) {
        if (passwordTextField.text != "" && emailTextField.text != "") {
            let loginManager = FirebaseAuthManager()
            guard let email = emailTextField.text, let password = passwordTextField.text else {
                return
            }
            loginManager.signIn(email: email, pass: password) {[weak self] (success) in
                guard let `self` = self else {return}
                var message:String = ""
                if(success){
                    message = "User was logged in successfuly"
                } else {
                        message = "There was an error"
                        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
                        alertController.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                        return
                }
                self.performSegue(withIdentifier: "login.to.main", sender: nil)
            }
        }else{
            return
        }
    }
    
    @objc func doneButtonTapped() {
           view.endEditing(true)
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
