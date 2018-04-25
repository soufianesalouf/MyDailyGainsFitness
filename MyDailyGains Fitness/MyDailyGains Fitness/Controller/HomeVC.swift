//
//  HomeVC.swift
//  MyDailyGains Fitness
//
//  Created by Soufiane Salouf on 4/22/18.
//  Copyright © 2018 Soufiane Salouf. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var menuBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
    }
}
   
