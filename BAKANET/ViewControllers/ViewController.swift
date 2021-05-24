//
//  ViewController.swift
//  BAKANET
//
//  Created by Hristiyan Bakalov on 26/04/2021.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

func checkPasswordsMatch(firstPassword textField:UITextField , secondPassword repeatTextField:UITextField)->Bool{
    if (textField.text != repeatTextField.text){
        return false
    }else{
        return true
    }
}

func checkEmailFormat(email adress:String)->Bool{
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPred = NSPredicate(format :"SELF MATCHES %@", emailRegEx)
    
    return emailPred.evaluate(with: adress)
}

class ViewController: UIViewController {

    
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var LogoLabel: UILabel!
    @IBOutlet weak var RegisterButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func registerButtonPressed(_ sender: RoundedBakaButton) {
        if(checkEmailFormat(email: emailTextField.text!) && checkPasswordsMatch(firstPassword: passwordTextField, secondPassword: repeatPasswordTextField)){
            print("Email: OK Format")
        }else{
            print("Email: Not OK Format")
            return
        }
        let signUpManager = FirebaseAuthManager()
        if let email = emailTextField.text , let password = passwordTextField.text{
            signUpManager.createUser(email: email, password: password) {[weak self] (success) in
                guard let sel = self else {return}
                
                if (success){
                    print("User was successfuly created")
                    let docData: [String: Any] = [
                        "fname": self?.firstNameTextField.text! ?? "" ,
                        "lname": self?.lastNameTextField.text!  ?? ""
                    ]
                    let db = Firestore.firestore()
                    let userId = Auth.auth().currentUser?.uid
                    db.collection("Users").document(userId!).setData(docData)
                }else{
                    print("An error occured")
                }
                sel.performSegue(withIdentifier: "register.to.login", sender: nil)
            }
        }
    }
    
   
    
    
    
}

