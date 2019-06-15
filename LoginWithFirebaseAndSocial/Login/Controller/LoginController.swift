//
//  LoginController.swift
//  LoginWithFirebaseAndSocial
//
//  Created by Nikolas on 11/06/2019.
//  Copyright © 2019 Nikolas Aggelidis. All rights reserved.
//


import UIKit
import FBSDKLoginKit


class LoginController: UIViewController {

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupFBLoginButton()
    }
    
    
    func setupFBLoginButton() {
        
        let fbLoginButton = FBSDKLoginButton()
        fbLoginButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(fbLoginButton)
        
        //Set x, y, width, height constraints for fbLoginButton:
        fbLoginButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 32).isActive = true
        fbLoginButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
        fbLoginButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -32).isActive = true
        fbLoginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        fbLoginButton.delegate = self
    }
}

