//
//  FirebaseAuthManager.swift
//  walkingApp
//
//  Created by John Hur on 2022/01/19.
//

import Foundation
import FirebaseAuth

// Firebase 회원가입 함수
class FirebaseAuthManager {
    
    func createUser(email: String, password: String, completionBlock: @escaping (_ success: Bool) -> Void) {
            Auth.auth().createUser(withEmail: email, password: password) {(authResult, error) in
                if let user = authResult?.user {
                    print(user)
                    completionBlock(true)
                } else {
                    completionBlock(false)
                }
            }
        }
    
}
