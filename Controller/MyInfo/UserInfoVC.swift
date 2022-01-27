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
    
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
    }
    @IBAction func settingBtn(_ sender: Any) {
        
        let alert = UIAlertController(title: "프로필 사진설정", message: "", preferredStyle: .actionSheet)
        
        let libary = UIAlertAction(title: "사진앨범", style: .default) { (action) in
            self.openLibrary()
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(libary)
        alert.addAction(cancel)
        present(alert, animated: true,completion: nil)
       

    }
    func openLibrary(){
        picker.sourceType = .photoLibrary
        present(picker, animated: false, completion: nil)
    }
    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage? {

        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        try! Auth.auth().signOut()
        GIDSignIn.sharedInstance().signOut()

    }

}
extension UserInfoVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else{
            fatalError()
        }
        let resizedImage = resizeImage(image: selectedImage, newWidth: 300)
        let imageData = resizedImage?.jpegData(compressionQuality: 0.5)
        
        
    }
}
