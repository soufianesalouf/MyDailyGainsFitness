//
//  DataService.swift
//  MyDailyGains Fitness
//
//  Created by Soufiane Salouf on 4/26/18.
//  Copyright © 2018 Soufiane Salouf. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = Database.database().reference()

class DataService {
    static let instance = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    func createBDUser(uid: String, userData: Dictionary<String , Any>) {
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
}
