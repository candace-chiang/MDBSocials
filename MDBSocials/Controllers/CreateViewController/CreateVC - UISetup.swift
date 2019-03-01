//
//  CreateVC - UISetup.swift
//  MDBSocials
//
//  Created by Candace Chiang on 2/28/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit

extension CreateViewController {
    func setUpBackground() {
        view.backgroundColor = UIColor(hexString: "#2ECCFA")
    }
    
    func setUpNavbar() {
        self.navigationController!.isNavigationBarHidden = false
        self.navigationItem.hidesBackButton = true
        self.navigationController!.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        self.navigationController!.navigationBar.barTintColor = UIColor(hexString: "#2ECCFA")
        self.navigationController!.navigationBar.tintColor = .white
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(cancelEvent))
    }
    
    func setUpImagePicker() {
        imagePicker = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width * 4/5, height: view.frame.height/4))
        imagePicker.center = CGPoint(x: view.frame.width/2, y: view.frame.height/7)
        imagePicker.setImage(UIImage(named: "question"), for: .normal)
        imagePicker.imageView?.contentMode = .scaleAspectFit
        imagePicker.addTarget(self, action: #selector(openImageOptions), for: .touchUpInside)
        view.addSubview(imagePicker)
        
        imageView = UIImageView(frame: CGRect(x: view.frame.width * 0.52, y: imagePicker.frame.maxY - view.frame.height/10, width: view.frame.width/8, height: view.frame.width/8))
        imageView.image = UIImage(named: "click")
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
    }
    
    func setUpFields() {
        nameField = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width * 4/5, height: view.frame.height/15))
        nameField.center = CGPoint(x: view.frame.width/2, y: imagePicker.frame.maxY + view.frame.height/20)
        nameField.font = UIFont(name: "SourceCodePro-Bold", size: 32)
        nameField.textColor = .white
        nameField.textAlignment = .center
        nameField.attributedText = NSAttributedString(string: "Event Name",
                                                       attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        nameField.backgroundColor = UIColor(hexString: "#2ECCFA")
        nameField.borderStyle = .none
        nameField.adjustsFontSizeToFitWidth = true
        nameField.addTarget(self, action: #selector(nameEntered), for: .allEditingEvents)
        view.addSubview(nameField)
        
        descField = UITextView(frame: CGRect(x: 0, y: 0, width: view.frame.width * 11/12, height: view.frame.height/8))
        descField.center = CGPoint(x: view.frame.width/2, y: nameField.frame.maxY + view.frame.height/13)
        descField.font = UIFont(name: "SourceCodePro-Regular", size: 20)
        descField.textColor = .white
        descField.textAlignment = .center
        descField.text = "Event Description"
        descField.backgroundColor = UIColor(hexString: "#2ECCFA")
        descField.textContainer.maximumNumberOfLines = 2
        descField.textContainer.lineBreakMode = .byClipping
        view.addSubview(descField)
        
        datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: view.frame.width * 4/5, height: view.frame.height/6))
        datePicker.center = CGPoint(x: view.frame.width/2, y: descField.frame.maxY + view.frame.height/18)
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        view.addSubview(datePicker)
    }
    
    func setUpButtons() {
        createButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width/3, height: view.frame.height/18))
        createButton.center = CGPoint(x: view.frame.width/2, y: datePicker.frame.maxY + view.frame.height/12)
        createButton.backgroundColor = UIColor(hexString: "#0174DF")
        createButton.setTitle("Create", for: .normal)
        createButton.setTitleColor(.white, for: .normal)
        createButton.titleLabel!.font = UIFont(name: "RifficFree-Bold", size: 20)
        createButton.layer.borderColor = UIColor(hexString: "#00BFF").cgColor
        createButton.layer.cornerRadius = 5.0
        createButton.addTarget(self, action: #selector(createEvent), for: .touchUpInside)
        view.addSubview(createButton)
    }
    
}
