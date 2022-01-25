//
//  LoginVC.swift
//  walkingApp
//
//  Created by John Hur on 2022/01/19.
//

import Foundation
import UIKit
import FirebaseAuth
import Firebase
import GoogleSignIn


/// 로그인 뷰컨
class LoginVC: UIViewController {
    
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var emailBackView: UIView!
    @IBOutlet var passwordBackView: UIView!
    
    @IBOutlet var loginButtonView: UIButton!
    @IBOutlet var registerButtonView: UIButton!
    
    @IBOutlet var googleSignInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
        GIDSignIn.sharedInstance()?.presentingViewController = self // 로그인화면 불러오기
        GIDSignIn.sharedInstance()?.restorePreviousSignIn() // 자동로그인
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func loginButton(_ sender: Any) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            if error == nil && user != nil {
                UserDefaults.standard.set(email, forKey: "userId")
                self.dismiss(animated: false, completion: nil)
            } else {
                print("Error logging in: \(error!.localizedDescription)")
                print("로그인 에러")
            }
        }
    }
    
    @IBAction func registerButton(_ sender: Any) {
        
    }
    
    @IBAction func googleSignInButtonPressed(_ sender: GIDSignInButton) {
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    
    
}

