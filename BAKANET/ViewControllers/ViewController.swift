//
//  ViewController.swift
//  BAKANET
//
//  Created by Hristiyan Bakalov on 26/04/2021.
//

import UIKit

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
                var message: String = ""
                if (success){
                    message = "User was successfuly created"
                    //DO SOMETHING HERE
                }else{
                    message = "An error occured"
                }
                let alertControl = UIAlertController(title: nil, message: message, preferredStyle: .alert)
                alertControl.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                sel.present(alertControl, animated: true, completion: nil)
            }
        }
    }
    
   
    
    
    
}

