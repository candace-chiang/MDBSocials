//
//  RegisterVC - UISetup.swift
//  MDBSocials
//
//  Created by Candace Chiang on 2/25/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit

extension RegisterViewController {
    func setUpBackground() {
        view.backgroundColor = UIColor(hexString: "#2ECCFA")
        
        catView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width * 2/3, height: view.frame.height/5))
        catView.center = CGPoint(x: view.frame.width/2, y: view.frame.height/6)
        catView.image = UIImage(named: "cat")
        catView.contentMode = .scaleAspectFit
        view.addSubview(catView)
        
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height/8))
        titleLabel.center = CGPoint(x: view.frame.width/2, y: catView.frame.maxY + view.frame.height/30)
        titleLabel.text = "Register"
        titleLabel.font = UIFont(name: "RifficFree-Bold", size: 45)
        titleLabel.textColor = UIColor(hexString: "#F4F12B")
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)
    }
    
    func setUpFields() {
        let fieldWidth = view.frame.width * 4/5
        let fieldHeight = view.frame.height/15
        let yOffset = view.frame.height/20
        
        nameField = UITextField(frame: CGRect(x: 0, y: 0, width: fieldWidth, height: fieldHeight))
        nameField.center = CGPoint(x: view.frame.width/2, y: titleLabel.frame.maxY + view.frame.height/25)
        nameField.font = UIFont(name: "SourceCodePro-Regular", size: 18)
        nameField.placeholder = "Name"
        nameField.borderStyle = .roundedRect
        nameField.layer.cornerRadius = 5.0
        nameField.addTarget(self, action: #selector(nameEntered), for: .allEditingEvents)
        view.addSubview(nameField)
        
        usernameField = UITextField(frame: CGRect(x: 0, y: 0, width: fieldWidth, height: fieldHeight))
        usernameField.center = CGPoint(x: view.frame.width/2, y: nameField.frame.maxY + yOffset)
        usernameField.font = UIFont(name: "SourceCodePro-Regular", size: 18)
        usernameField.placeholder = "Username"
        usernameField.borderStyle = .roundedRect
        usernameField.layer.cornerRadius = 5.0
        usernameField.addTarget(self, action: #selector(usernameEntered), for: .allEditingEvents)
        view.addSubview(usernameField)
        
        emailField = UITextField(frame: CGRect(x: 0, y: 0, width: fieldWidth, height: fieldHeight))
        emailField.center = CGPoint(x: view.frame.width/2, y: usernameField.frame.maxY + yOffset)
        emailField.font = UIFont(name: "SourceCodePro-Regular", size: 18)
        emailField.placeholder = "Email"
        emailField.borderStyle = .roundedRect
        emailField.layer.cornerRadius = 5.0
        emailField.addTarget(self, action: #selector(emailEntered), for: .allEditingEvents)
        view.addSubview(emailField)
        
        passwordField = UITextField(frame: CGRect(x: 0, y: 0, width: fieldWidth, height: fieldHeight))
        passwordField.center = CGPoint(x: view.frame.width/2, y: emailField.frame.maxY + yOffset)
        passwordField.font = UIFont(name: "SourceCodePro-Regular", size: 18)
        passwordField.placeholder = "Password"
        passwordField.borderStyle = .roundedRect
        passwordField.layer.cornerRadius = 5.0
        passwordField.addTarget(self, action: #selector(passwordEntered), for: .allEditingEvents)
        view.addSubview(passwordField)
        
        confirmField = UITextField(frame: CGRect(x: 0, y: 0, width: fieldWidth, height: fieldHeight))
        confirmField.center = CGPoint(x: view.frame.width/2, y: passwordField.frame.maxY + yOffset)
        confirmField.font = UIFont(name: "SourceCodePro-Regular", size: 18)
        confirmField.placeholder = "Re-enter your password"
        confirmField.borderStyle = .roundedRect
        confirmField.layer.cornerRadius = 5.0
        view.addSubview(confirmField)
    }
    
    func setUpButtons() {
        registerButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width/3, height: view.frame.height/18))
        registerButton.center = CGPoint(x: view.frame.width/2, y: confirmField.frame.maxY + view.frame.height/15)
        registerButton.backgroundColor = UIColor(hexString: "#0174DF")
        registerButton.setTitle("Sign Up!", for: .normal)
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.titleLabel!.font = UIFont(name: "RifficFree-Bold", size: 20)
        registerButton.layer.borderColor = UIColor(hexString: "#00BFF").cgColor
        registerButton.layer.cornerRadius = 5.0
        registerButton.addTarget(self, action: #selector(signUpAttempt), for: .touchUpInside)
        view.addSubview(registerButton)
    }
}
