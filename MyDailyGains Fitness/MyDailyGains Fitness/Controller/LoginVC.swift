//
//  LoginVC.swift
//  MyDailyGains Fitness
//
//  Created by Soufiane Salouf on 4/26/18.
//  Copyright © 2018 Soufiane Salouf. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var emailField: InsetTextField!
    @IBOutlet weak var passwordFeild: InsetTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        passwordFeild.delegate = self
        loginBtn.bindToKeyboard()

    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        if emailField.text != nil && passwordFeild.text != nil {
            AuthService.instance.loginUser(withEmail: emailField.text!, andPassword: passwordFeild.text!) { (success, loginError) in
                if success {
                    self.dismissDetail()
//                    self.dismiss(animated: true, completion: nil)
                } else {
                    debugPrint(loginError?.localizedDescription ?? "Couldn't login")
                }
                
                AuthService.instance.registerUser(withEmail: self.emailField.text!, andPassword: self.passwordFeild.text!, userCreationComplete: { (success, registerError) in
                    if success {
                        AuthService.instance.loginUser(withEmail: self.emailField.text!, andPassword: self.passwordFeild.text!, loginComplete: { (success, nil) in
                            self.dismissDetail()
//                            self.dismiss(animated: true, completion: nil)
                        })
                    } else {
                        debugPrint(registerError?.localizedDescription ?? "Couldn't Register")
                    }
                })
            }
        }
    }
    
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismissDetail()
//        dismiss(animated: true, completion: nil)
    }
}

extension LoginVC: UITextFieldDelegate {
    
}
