//
//  AuthVC.swift
//  MyDailyGains Fitness
//
//  Created by Soufiane Salouf on 4/26/18.
//  Copyright © 2018 Soufiane Salouf. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func signInWithEmailPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginVC")
        presentDetail(loginVC)
//        present(loginVC, animated: true, completion:  nil)
    }
    
    @IBAction func googleSignInPressed(_ sender: Any) {
    }
    
    @IBAction func facebookSignInPressed(_ sender: Any) {
    }
    
    
}
