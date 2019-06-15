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


extension LoginController: FBSDKLoginButtonDelegate {
    
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
        print("User did logout from Facebook. Feel free to come back again :)")
    }
    
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        if error != nil {
            
            print(error)
            
            return
        }
        
        print("User successfully logged in with Facebook!")
    }
}
