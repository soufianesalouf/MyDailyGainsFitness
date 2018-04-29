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
    private var _REF_PROFILES = DB_BASE.child("profiles")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    var REF_PROFILES: DatabaseReference {
        return _REF_PROFILES
    }
    
    func createBDUser(uid: String, userData: Dictionary<String , Any>) {
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
    func uploadProfile(userProfile: UserProfile, uploadComplete: @escaping (_ status: Bool) -> ()){
        REF_PROFILES.childByAutoId().updateChildValues(["userId": userProfile.userId, "firstName": userProfile.firstName, "lastName":userProfile.lastName, "gender":userProfile.gender, "birthDate":userProfile.birthDate, "weight":userProfile.weight, "height":userProfile.height])
        uploadComplete(true)
    }
    
    func getUserProfileInfo(handler: @escaping (_ profile: UserProfile) -> ()){
        print("ininin1")
        REF_PROFILES.observeSingleEvent(of: .value) { (userProfileSnapshot) in
            print("in1")
            guard let userProfileSnapshot = userProfileSnapshot.children.allObjects as? [DataSnapshot] else { return }
            print("3")
            for profile in userProfileSnapshot {
                print("4")
                let userId = profile.childSnapshot(forPath: "userId").value as! String
                if Auth.auth().currentUser?.uid == userId {
                    let firstName = profile.childSnapshot(forPath: "firstName").value as! String
                    let lastName = profile.childSnapshot(forPath: "lastName").value as! String
                    let gender = profile.childSnapshot(forPath: "gender").value as! String
                    let birthDate = profile.childSnapshot(forPath: "birthDate").value as! String
                    let weight = profile.childSnapshot(forPath: "weight").value as! String
                    let height = profile.childSnapshot(forPath: "height").value as! String
                    let userProfile = UserProfile(userId: userId, firstName: firstName, lastName: lastName, gender: gender, birthDate: birthDate, weight: weight, height: height)
                    handler(userProfile)
                }
            }
        }
    }
    
}
