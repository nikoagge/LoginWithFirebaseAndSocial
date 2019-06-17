//
//  LoginController.swift
//  LoginWithFirebaseAndSocial
//
//  Created by Nikolas on 11/06/2019.
//  Copyright © 2019 Nikolas Aggelidis. All rights reserved.
//


import UIKit
import FBSDKLoginKit
import Firebase


class LoginController: UIViewController {

    
    lazy var fbLoginButton: FBLoginButton = {
        
        let fblb = FBLoginButton()
        fblb.translatesAutoresizingMaskIntoConstraints = false
        fblb.delegate = self
        fblb.permissions = ["email", "public_profile"]
        
        return fblb
    }()
    
    lazy var customFBLoginButton: UIButton = {
        
        let cfblb = UIButton(type: .system)
        cfblb.backgroundColor = .blue
        cfblb.setTitle("Custom FB Login", for: .normal)
        cfblb.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        cfblb.setTitleColor(.white, for: .normal)
        cfblb.translatesAutoresizingMaskIntoConstraints = false
        
        cfblb.addTarget(self, action: #selector(customFBLoginButtonTapped), for: .touchUpInside)
        
        return cfblb
    }()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
    }
    
    
    func setupViews() {
        
        view.addSubview(fbLoginButton)
        view.addSubview(customFBLoginButton)
        
        //Set x, y, width, height constraints for fbLoginButton:
        fbLoginButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 32).isActive = true
        fbLoginButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
        fbLoginButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -32).isActive = true
        fbLoginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //Set x, y, width, height constraints for customFBLoginButton:
        customFBLoginButton.leftAnchor.constraint(equalTo: fbLoginButton.leftAnchor).isActive = true
        customFBLoginButton.topAnchor.constraint(equalTo: fbLoginButton.bottomAnchor, constant: 66).isActive = true
        customFBLoginButton.rightAnchor.constraint(equalTo: fbLoginButton.rightAnchor).isActive = true
        customFBLoginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    
    @objc func customFBLoginButtonTapped() {
        
        LoginManager().logIn(permissions: ["email"], from: self) { (result, error) in
            
            if error != nil {
                
                print("Custom FB Login failed:", error)
                
                return
            }
            
            self.showEmailAddress()
        }
    }
}

