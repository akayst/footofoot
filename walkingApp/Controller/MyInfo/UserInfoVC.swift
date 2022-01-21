//
//  MyInfoVC.swift
//  walkingApp
//
//  Created by John Hur on 2022/01/16.
//

import UIKit
import Firebase
import FirebaseDatabase
import GoogleSignIn


class UserInfoVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        try! Auth.auth().signOut()
        GIDSignIn.sharedInstance().signOut()

    }
    
}
