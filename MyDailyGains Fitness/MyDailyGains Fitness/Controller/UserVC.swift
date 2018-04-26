//
//  UserVC.swift
//  MyDailyGains Fitness
//
//  Created by Soufiane Salouf on 4/25/18.
//  Copyright © 2018 Soufiane Salouf. All rights reserved.
//

import UIKit

class UserVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var firstNameTextFeild: InsetTextField!
    @IBOutlet weak var completeBtn: UIButton!
    @IBOutlet weak var femaleBtn: UIButton!
    @IBOutlet weak var maleBtn: UIButton!
    @IBOutlet weak var heightTextFeild: InsetTextField!
    @IBOutlet weak var weightTextFeild: InsetTextField!
    @IBOutlet weak var bithdateTextFeild: InsetTextField!
    @IBOutlet weak var lastNameTextFeild: InsetTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        completeBtn.bindToKeyboard()
    }
    
    @IBAction func closeWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
