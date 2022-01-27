//
//  UserService.swift
//  walkingApp
//
//  Created by John Hur on 2022/01/18.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase

class UserService {
    
    static var currentUserProfile: UserProfile?
    
    static func observeUserProfile(_ uid: String, completion: @escaping ((_ userProfile: UserProfile?) -> ())) {
        
        let userRef = Database.database().reference().child("users/profile/\(uid)")
        
        userRef.observe(.value, with: { snapshot in
            var userProfile: UserProfile?
            
            if let dict = snapshot.value as? [String: Any],
               let username = dict["username"] as? String {
                userProfile = UserProfile(uid: snapshot.key, username: username)
            }
                
            completion(userProfile)
        })
    }
    
    
}
