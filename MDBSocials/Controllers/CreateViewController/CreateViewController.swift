//
//  CreateViewController.swift
//  MDBSocials
//
//  Created by Candace Chiang on 2/28/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController, UITextFieldDelegate {
    
    var imageView: UIImageView!
    var imagePicker: UIButton!
    
    var nameField: UITextField!
    var descField: UITextView!
    var datePicker: UIDatePicker!
    
    //no variable names because UITextView has no addTarget function and consistency -_-
    
    var createButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpBackground()
        setUpImagePicker()
        setUpFields()
        setUpButtons()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        setUpNavbar()
        self.nameField.delegate = self
        self.descField.delegate = self
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        nameField.text = ""
        descField.text = ""
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
    
    @objc func cancelEvent(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

}
