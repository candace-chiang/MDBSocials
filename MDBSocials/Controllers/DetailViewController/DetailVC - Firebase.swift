//
//  DetailVC - Firebase.swift
//  MDBSocials
//
//  Created by Candace Chiang on 3/1/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import Foundation

import UIKit
import FirebaseAuth
import FirebaseDatabase

extension DetailViewController {
    
    @objc func interested() {
        interestButton.isSelected = !interestButton.isSelected
        
        var delta = 0
        if interestButton.isSelected {
            delta = 1
        } else {
            delta = -1
        }
        
        let ref = Database.database().reference().child("events").child(event.id)
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            guard let value = snapshot.value as? NSDictionary else {
                return
            }
            var interestedPeople = value["interested"] as? [String] ?? []
            let currentID = Auth.auth().currentUser!.uid
            
            let alreadyThere = interestedPeople.contains(currentID)
            
            if !alreadyThere && delta > 0 {
                interestedPeople.append(currentID)
            } else if alreadyThere && delta < 0{
                interestedPeople.remove(at: interestedPeople.index(of: currentID)!)
            }
            
            ref.updateChildValues(["interested": interestedPeople], withCompletionBlock: { (error, ref) in
                if error != nil {
                    return
                } else {
                    self.numberLabel.text = "\(interestedPeople.count)"
                }
            })
            
            
        })
    }
}
