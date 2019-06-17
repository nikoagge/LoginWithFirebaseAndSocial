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
        
        GraphRequest(graphPath: "/me", parameters: ["fields": "id, name, email"]).start { (connection, result, error) in
            
            if error != nil {
                
                print("Failed to start graph request:", error)
                
                return
            }
            
            print(result)
        }
    }
}
