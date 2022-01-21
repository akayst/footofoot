//
//  SettingsVC.swift
//  walkingApp
//
//  Created by John Hur on 2022/01/19.
//

import UIKit
import Firebase
import FirebaseDatabase
import GoogleSignIn


class SettingsVC: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logoutButton(_ sender: UIButton) {
        try! Auth.auth().signOut()
        GIDSignIn.sharedInstance().signOut()

    }
    
}
