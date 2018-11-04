//
//  MenuVC.swift
//  MyDailyGains Fitness
//
//  Created by Soufiane Salouf on 4/22/18.
//  Copyright © 2018 Soufiane Salouf. All rights reserved.
//

import UIKit
import Firebase

class MenuVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var profileIMage: UIImageView!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var infoLbl: UILabel!
    
    var userProfile: UserProfile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.getUserProfileInfo { (profile) in
            print("3")
            self.userProfile = profile
        }
        print("\(userProfile.firstName)")
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//                print("1")
//                DataService.instance.getUserProfileInfo { (profile) in
//                    print("3")
//                    self.userProfile = profile
//                }
//                print("\(userProfile.firstName)")
//        //        usernameLbl.text = "\(userProfile.firstName)  \(userProfile.lastName)"
//        //        infoLbl.text = "\(userProfile.weight) kg, \(userProfile.height) cm"
//    }
    
    @IBAction func profileBtnPressed(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "UserVC")
        present(loginVC!, animated: true, completion:  nil)
    }
    
    @IBAction func signOutBtnPressed(_ sender: Any) {
        let logoutPopup = UIAlertController(title: "Logout?", message: "Are you sure you want to logout?", preferredStyle: .actionSheet)
        let logoutAction = UIAlertAction(title: "logout?", style: .destructive) { (buttonTapped) in
            do {
                try Auth.auth().signOut()
                let authVC = self.storyboard?.instantiateViewController(withIdentifier: "AuthVC") as? AuthVC
                self.present(authVC!, animated: true, completion: nil)
            } catch {
                print(error)
            }
        }
        logoutPopup.addAction(logoutAction)
        present(logoutPopup,animated: true, completion: nil)
    }
    
    
}
