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
    
    init(id: String, postDict: [String: Any]) {
        self.id = id
        self.title = postDict["title"] as? String
        
        let desc = postDict["description"] as? String
        if desc != "" {
            self.description = desc
        } else {
            self.description = "No details :(."
        }
        
        if let dateString = postDict["date"] as? String {
            self.date = dateString.toDate()
        } else {
            self.date = Date.init()
        }
        
        self.poster = postDict["poster"] as? String
        self.interested = postDict["interested"] as? [String]
        
        self.image = UIImage(named: "question")
        
    }
    
}
