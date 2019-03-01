//
//  CreateVC - Create.swift
//  MDBSocials
//
//  Created by Candace Chiang on 3/1/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

extension CreateViewController {
    @objc func createEvent() {
        var event: [String: Any] = [:]
        
        if name == "" {
            displayAlert(title: "Incomplete", message: "Please enter an event name.")
        }
        
        event["title"] = name
        event["description"] = descField.text!
        event["date"] = datePicker.date.description
        event["poster"] = Auth.auth().currentUser?.uid
        event["interested"] = []
        
        let ref = Database.database().reference().child("Events")
        let id = ref.childByAutoId().key
        event["id"] = id
        
        let imageRef = Storage.storage().reference().child("images").child(id)
        let data = UIImagePNGRepresentation(imagePicker.imageView!.image!)!
        imageRef.putData(data, metadata: nil) { (metadata, error) in
            if metadata == nil {
                return
            }
            imageRef.downloadURL { (url, error) in
                if url == nil {
                    return
                }
                self.pushEvent(event: event)
            }
        }
    }
    
    func pushEvent(event: [String: Any]) {
        let ref = Database.database().reference().child("events").child(event["id"] as! String)
        ref.updateChildValues(event, withCompletionBlock: { (error, ref) in
            if error != nil {
                return
            }
            self.dismiss(animated: true, completion:nil)
        })
    }
    
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
