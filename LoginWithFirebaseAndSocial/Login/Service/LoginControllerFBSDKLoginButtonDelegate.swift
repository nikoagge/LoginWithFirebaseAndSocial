//
//  LoginControllerFBSDKLoginButtonDelegate.swift
//  LoginWithFirebaseAndSocial
//
//  Created by Nikolas on 15/06/2019.
//  Copyright © 2019 Nikolas Aggelidis. All rights reserved.
//


import Foundation
import UIKit
import FBSDKLoginKit
import Firebase


extension LoginController: LoginButtonDelegate {
    
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton!) {
        
        print("User did logout from Facebook. Feel free to come back again :)")
    }
    
    
    func loginButton(_ loginButton: FBLoginButton!, didCompleteWith result: LoginManagerLoginResult!, error: Error!) {
        
        if error != nil {
            
            print(error)
            
            return
        }
        
        self.showEmailAddress()
    }
    
    
    func showEmailAddress() {
        
        let accessToken = AccessToken.current
        
        guard let accessTokenString = accessToken?.tokenString else { return }
        let credentials = FacebookAuthProvider.credential(withAccessToken: accessTokenString)
        
        Auth.auth().signIn(with: credentials) { (user, error) in
            
            if error != nil {
                
                print("Something went wrong with our FB user: ", error)
                
                return
            }
            
            print("Successfully logged in")
        }
        
        GraphRequest(graphPath: "/me", parameters: ["fields": "id, name, email"]).start { (connection, result, error) in
            
            if error != nil {
                
                print("Failed to start graph request:", error)
                
                return
            }
            
            print(result)
        }
    }
}
