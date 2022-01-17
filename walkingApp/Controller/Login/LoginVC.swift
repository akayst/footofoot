//
//  LoginVC.swift
//  walkingApp
//
//  Created by John Hur on 2022/01/16.
//

import UIKit
import GoogleSignIn

class LoginVC: UIViewController {
    
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var emailTextFieldView: UIView!
    @IBOutlet var passwordTextFieldView: UIView!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var registerButton: UIButton!
    
    @IBOutlet var googleSignInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        googleSignInButton
        
    }
    
    @IBAction func loginButton(_ sender: Any) {
        
    }
    
    @IBAction func registerButton(_ sender: Any) {
        
    }
    
    @IBAction func googleSignInButton(_ sender: GIDSignInButton) {
        
    }
    
}
