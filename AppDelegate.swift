//
//  AppDelegate.swift
//  walkingApp
//
//  Created by akay on 2022/01/10.
//

import UIKit
import Firebase
import GoogleSignIn

@main
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

    var distanceInfo : Double?
    var walkingPointInfo : Double?
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // Use Firebase library to configure APIs
        FirebaseApp.configure()
        
        GIDSignIn.sharedInstance().clientID = "\(ClientApi.gIdSignInClientId)"
        GIDSignIn.sharedInstance()?.delegate = self
        
        let authListener = Auth.auth().addStateDidChangeListener { auth, user in
            
            let mainstoryboard = UIStoryboard(name: "BottomTabBar", bundle: nil)
            let loginStoryboard = UIStoryboard(name: "Login", bundle: nil)
            
            if user != nil {
                
                UserService.observeUserProfile(user!.uid) { userProfile in
                    UserService.currentUserProfile = userProfile
                }
                
                let controller = mainstoryboard.instantiateViewController(withIdentifier: "MainTabBarController") as! UITabBarController
                self.window?.rootViewController = controller
                self.window?.makeKeyAndVisible()
                print("logged in")

            } else {
                UserService.currentUserProfile = nil
                
                let controller = loginStoryboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
                self.window?.rootViewController = controller
                self.window?.makeKeyAndVisible()
                print("not logged in")

            }
            
        }
        
        return true
    }

    
    //MARK: - GoogleSignIn
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        // Check for sign in error
            if let error = error {
                if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                    print("The user has not signed in before or they have since signed out.")
                } else {
                    print("\(error.localizedDescription)")
                }
                return
            }
            // Get credential object using Google ID token and Google access token
            guard let authentication = user.authentication else {
                return
            }
            let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                           accessToken: authentication.accessToken)
            // Authenticate with Firebase using the credential object
            Auth.auth().signIn(with: credential) { (authResult, error) in
                if let error = error {
                    print("Error occurs when authenticate with Firebase: \(error.localizedDescription)")
                }
                // Post notification after user successfully sign in
                print("로그인이 되었습니다.")
                // 알림창 띄워주고 다음화면으로
                
                NotificationCenter.default.post(name: .AuthStateDidChange, object: nil)
            }
    }

    @available(iOS 9.0, *)
    func application(_ application: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any])
      -> Bool {
        return GIDSignIn.sharedInstance().handle(url)
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    

}

