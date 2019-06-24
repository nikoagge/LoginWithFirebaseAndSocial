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
import GoogleSignIn


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
    
    
    lazy var googleButton: GIDSignInButton = {
        
        let gb = GIDSignInButton()
        gb.translatesAutoresizingMaskIntoConstraints = false
        
        GIDSignIn.sharedInstance()?.delegate = self
        
        return gb
    }()
    
    lazy var customGoogleLoginButton: UIButton = {
        
        let cglb = UIButton(type: .system)
        cglb.backgroundColor = .orange
        cglb.setTitle("Custom Google Sign In", for: .normal)
        cglb.setTitleColor(.white, for: .normal)
        cglb.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        cglb.translatesAutoresizingMaskIntoConstraints = false
        
        cglb.addTarget(self, action: #selector(customGoogleLoginButtonTapped), for: .touchUpInside)
        
        return cglb
    }()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
    }
    
    
    func setupViews() {
        
        view.addSubview(fbLoginButton)
        view.addSubview(customFBLoginButton)
        view.addSubview(googleButton)
        view.addSubview(customGoogleLoginButton)
        
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
        
        //Set x, y, width and height constraints for googleButton:
        googleButton.leftAnchor.constraint(equalTo: fbLoginButton.leftAnchor).isActive = true
        googleButton.topAnchor.constraint(equalTo: customFBLoginButton.bottomAnchor, constant: 66).isActive = true
        googleButton.rightAnchor.constraint(equalTo: fbLoginButton.rightAnchor).isActive = true
        googleButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //Set x, y, width and height constraints for customGoogleLoginButton:
        customGoogleLoginButton.leftAnchor.constraint(equalTo: googleButton.leftAnchor).isActive = true
        customGoogleLoginButton.topAnchor.constraint(equalTo: googleButton.bottomAnchor, constant: 66).isActive = true
        customGoogleLoginButton.rightAnchor.constraint(equalTo: googleButton.rightAnchor).isActive = true
        customGoogleLoginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
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
    
    
    @objc func customGoogleLoginButtonTapped() {
        
        GIDSignIn.sharedInstance()?.signIn()
    }
}

