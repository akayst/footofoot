//
//  RegisterVC.swift
//  walkingApp
//
//  Created by John Hur on 2022/01/17.
//

import UIKit

class RegisterVC: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func userSignUpButton(_ sender: UIButton) {
        didTapSignUpButton()
    }
    
    // 파베 서버로 가게되는 회원가입 함수
    @objc func didTapSignUpButton() {
        let signUpManager = FirebaseAuthManager()
        if let email = emailTextField.text, let password = passwordTextField.text {
            signUpManager.createUser(email: email, password: password) { [weak self] (success) in guard let `self` = self else {return}
                var message: String = ""
                if (success) {
                    message = "사용자의 아이디가 성공적으로 생성되었습니다."
                    self.performSegue(withIdentifier: "signUpSuccessSegue", sender: self)
                    // 다음 화면으로 이동
                } else {
                    message = "아이디 또는 비밀번호를 다시 입력해주세요."
                }
                let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alertController, animated: false)
            }
        }
    }

    
}
