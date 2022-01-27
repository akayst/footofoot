//
//  UserProfile.swift
//  walkingApp
//
//  Created by John Hur on 2022/01/18.
//

import Foundation

class UserProfile {
    var uid: String
    var username: String
    
    init(uid: String, username: String) {
        self.uid = uid
        self.username = username
    }
}
