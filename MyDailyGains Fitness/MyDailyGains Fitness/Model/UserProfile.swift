//
//  UserProfile.swift
//  MyDailyGains Fitness
//
//  Created by Soufiane Salouf on 4/27/18.
//  Copyright © 2018 Soufiane Salouf. All rights reserved.
//

import Foundation

class UserProfile {
    private var _userId: String
    private var _firstName: String
    private var _lastName: String
    private var _gender: String
    private var _birthDate: String
    private var _weight: String
    private var _height: String
    
    var userId: String {
        return _userId
    }
    
    var firstName: String {
        return _firstName
    }
    
    var lastName: String {
        return _lastName
    }
    
    var gender: String {
        return _gender
    }
    
    var birthDate: String {
        return _birthDate
    }
    
    var weight: String {
        return _weight
    }
    
    var height: String {
        return _height
    }
    
    init(userId: String, firstName: String, lastName: String, gender: String, birthDate: String, weight: String, height: String) {
        self._userId = userId
        self._firstName = firstName
        self._lastName = lastName
        self._gender = gender
        self._birthDate = height
        self._weight = weight
        self._height = height
    }
}
