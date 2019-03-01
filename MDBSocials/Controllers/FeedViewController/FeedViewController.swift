//
//  FeedViewController.swift
//  MDBSocials
//
//  Created by Candace Chiang on 2/26/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class FeedViewController: UIViewController {
    
    var tableView: UITableView!
    var events: [Event]! = []
    var selected: Event!
    
    let ref = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpBackground()
        setUpTable()
        getAllEvents()
        updateEvent()
        newEvent()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpNavbar()
        tableView.reloadData()
    }
    
    @objc func createEvent(_ sender: UIBarButtonItem) {
        present(UINavigationController(rootViewController: CreateViewController()), animated: true, completion: nil)
    }
    
    @objc func logOut(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        guard(navigationController?.popToRootViewController(animated: true))
            != nil
            else{
                print("You are signed out")
                return
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
                case "toDetails":
                    let detailVC = segue.destination as! DetailViewController
                    detailVC.event = selected
                    break
                default: break
            }
        }
    }

}
