//
//  FeedVC - Firebase.swift
//  MDBSocials
//
//  Created by Candace Chiang on 3/1/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage

extension FeedViewController {
    func getAllEvents() {
        let eventsRef = Database.database().reference().child("events")
        let imagesRef = Storage.storage().reference().child("images")
        
        eventsRef.observeSingleEvent(of: .value, with: { (snapshot) in
            let allEvents = snapshot.value as? [String : Any] ?? [:]
            var newEvents: [Event] = []
            
            
            for (key, value) in allEvents {
                let event = Event(id: key, event: value as! [String : Any])
                let image = imagesRef.child(key)
                image.getData(maxSize: 30 * 1024 * 1024) { data, error in
                    if let error = error {
                        event.image = UIImage(named: "fox lick")
                    } else {
                        event.image = UIImage(data: data!)
                    }
                }
                newEvents.append(event)
                
            }
            self.events = newEvents.sorted(by: { $0.date > $1.date })
            self.tableView.reloadData()
        })
    }
    
    func updateEvent() {
        let eventsRef = Database.database().reference().child("events")
        
        eventsRef.observe(DataEventType.childChanged, with: { (snapshot) in
            let newEvent = snapshot.value as? [String: Any] ?? [:]
            let event = Event(id: snapshot.key, event: newEvent)
            if let index = self.events.index(where: {$0.id == event.id}) {
                event.image = self.events[index].image
                self.events[index] = event
                self.tableView.reloadData()
            }
        })
    }
    
    func newEvent() {
        let eventsRef = Database.database().reference().child("events")
        let imagesRef = Storage.storage().reference().child("images")
        
        eventsRef.observe(DataEventType.childAdded, with: { (snapshot) in
            let newEvent = snapshot.value as? [String : Any] ?? [:]
            let event = Event(id: snapshot.key, event: newEvent)
            let image = imagesRef.child(snapshot.key)
            image.getData(maxSize: 5 * 1024 * 1024) { data, error in
                if error == nil {
                    event.image = UIImage(data: data!)
                }
            }
            self.events.append(event)
            self.events.sort(by: { $0.date > $1.date })
            self.tableView.reloadData()
        })
    }
}
