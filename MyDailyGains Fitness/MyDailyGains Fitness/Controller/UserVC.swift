//
//  UserVC.swift
//  MyDailyGains Fitness
//
//  Created by Soufiane Salouf on 4/25/18.
//  Copyright © 2018 Soufiane Salouf. All rights reserved.
//

import UIKit
import Firebase

class UserVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var firstNameTextFeild: InsetTextField!
    @IBOutlet weak var completeBtn: UIButton!
    @IBOutlet weak var femaleBtn: UIButton!
    @IBOutlet weak var maleBtn: UIButton!
    @IBOutlet weak var heightTextFeild: InsetTextField!
    @IBOutlet weak var weightTextFeild: InsetTextField!
    @IBOutlet weak var birthDateTextFeild: InsetTextField!
    @IBOutlet weak var lastNameTextFeild: InsetTextField!
    
    //var
    var gender: Gender = .male
    
    let picker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        completeBtn.bindToKeyboard()
        maleBtn.setSelectedColor()
        femaleBtn.setDeselectedColor()
        
        createDatePicker()
    }
    
    func createDatePicker(){
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolBar.setItems([done], animated: false)
        birthDateTextFeild.inputAccessoryView = toolBar
        birthDateTextFeild.inputView = picker
        
        //format for date
        picker.datePickerMode = .date
    }
    
    @objc func donePressed(){
        let formatter =  DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        let birthDate = formatter.string(from: picker.date)
        birthDateTextFeild.text = "\(birthDate)"
        self.view.endEditing(true)
    }
    
    @IBAction func maleBtnWasPressed(_ sender: Any) {
        gender = .male
        maleBtn.setSelectedColor()
        femaleBtn.setDeselectedColor()
    }
    
    @IBAction func femaleBtnWasPressed(_ sender: Any) {
        gender = .female
        maleBtn.setDeselectedColor()
        femaleBtn.setSelectedColor()
    }
    
    @IBAction func completeBtnWasPressed(_ sender: Any) {
        if firstNameTextFeild.text != "" && lastNameTextFeild.text != "" && birthDateTextFeild.text != "" && weightTextFeild.text != "" && heightTextFeild.text != "" {
            completeBtn.isEnabled = false
            let userProfile = UserProfile(userId: (Auth.auth().currentUser?.uid)!, firstName: firstNameTextFeild.text!, lastName: lastNameTextFeild.text!, gender: gender.rawValue, birthDate: birthDateTextFeild.text! , weight: weightTextFeild.text!, height: heightTextFeild.text!)
            DataService.instance.uploadProfile(userProfile: userProfile) { (isComplete) in
                if isComplete {
                    self.completeBtn.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                } else {
                    self.completeBtn.isEnabled = true
                    print("there was an error ")
                }
            }
        }
    }
    
    @IBAction func closeWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
