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
    @IBOutlet weak var infoLbl: UILabel!
    
    var userProfile: UserProfile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1")
        DataService.instance.getUserProfileInfo { (profile) in
            print("3")
            self.userProfile = profile
        }
        print("2")
        usernameLbl.text = "\(userProfile.firstName)  \(userProfile.lastName)"
        infoLbl.text = "\(userProfile.weight) kg, \(userProfile.height) cm"
    }
    
    @IBAction func profileBtnPressed(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "UserVC")
        present(loginVC!, animated: true, completion:  nil)
    }
    
    @IBAction func signOutBtnPressed(_ sender: Any) {
    }
    
    
}
