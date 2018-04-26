//
//  MenuVC.swift
//  MyDailyGains Fitness
//
//  Created by Soufiane Salouf on 4/22/18.
//  Copyright © 2018 Soufiane Salouf. All rights reserved.
//

import UIKit

class MenuVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var profileIMage: UIImageView!
    @IBOutlet weak var usernameLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func profileBtnPressed(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "UserVC")
        present(loginVC!, animated: true, completion:  nil)
    }
    
    @IBAction func signOutBtnPressed(_ sender: Any) {
    }
    
    
}
