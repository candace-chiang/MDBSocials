//
//  Event.swift
//  MDBSocials
//
//  Created by Candace Chiang on 2/26/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit

class Event {
    
    var id: String!
    var title: String!
    var description: String!
    var date: Date!
    
    var poster: String!
    var interested: [String]!
    
    var image: UIImage!
    
    init(id: String, event: [String: Any]) {
        self.id = id
        
        let poss = event["title"] as? String
        if poss != "" {
            self.title = poss
        } else {
            self.title = "Unknown..."
        }
        
        let desc = event["description"] as? String
        if desc != "" {
            self.description = desc
        } else {
            self.description = "No details :(."
        }
        
        if let dateString = event["date"] as? String {
            self.date = dateString.toDate()
        } else {
            self.date = Date.init()
        }
        
        self.poster = event["poster"] as? String
        
        if let val = event["interested"] as? [String] {
            self.interested = val
        } else {
            self.interested = []
        }
        
        self.image = UIImage(named: "question")
    }
    
}
