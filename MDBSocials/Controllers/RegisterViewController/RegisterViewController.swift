//
//  ViewController.swift
//  MDBSocials
//
//  Created by Candace Chiang on 2/25/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    var catView: UIImageView!
    var titleLabel: UILabel!
    
    var nameField: UITextField!
    var usernameField: UITextField!
    var emailField: UITextField!
    var passwordField: UITextField!
    var confirmField: UITextField!
    
    var name = ""
    var username = ""
    var email = ""
    var password = ""
    
    var registerButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpBackground()
        setUpFields()
        setUpButtons()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController!.isNavigationBarHidden = true
        self.nameField.delegate = self
        self.usernameField.delegate = self
        self.emailField.delegate = self
        self.passwordField.delegate = self
        self.confirmField.delegate = self
    }
    
    //dismiss keyboard when you press somewhere else
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //dismiss keyboard when you press return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func nameEntered(_ sender: UITextField) {
        name = sender.text!
    }
    
    @objc func usernameEntered(_ sender: UITextField) {
        username = sender.text!
    }
    
    @objc func emailEntered(_ sender: UITextField) {
        email = sender.text!
    }
    
    @objc func passwordEntered(_ sender: UITextField) {
        password = sender.text!
    }
    
    @objc func signUpAttempt(_ sender: UIButton) {
        if name == "" {
            displayAlert(title: "Incomplete", message: "Please enter in your name.")
            return
        } else if username == "" {
            displayAlert(title: "Incomplete", message: "Please enter in your username.")
            return
        } else if email == "" {
            displayAlert(title: "Incomplete", message: "Please enter in your email.")
            return
        } else if password == "" {
            displayAlert(title: "Incomplete", message: "Please enter in your password.")
            return
        } else if confirmField.text! != password {
            displayAlert(title: "Invalid", message: "Passwords do not match.")
            return
        }
        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
            if let error = error {
                self.registerButton.isUserInteractionEnabled = true
                print(error)
                return
            } else {
                let ref = Database.database().reference().child("users").child(self.username)
                ref.setValue(["name": self.name, "email": self.email])
                self.performSegue(withIdentifier: "toFeed", sender: self)
            }
        })
    }
    
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}
