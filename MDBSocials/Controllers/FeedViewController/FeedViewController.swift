//
//  FeedViewController.swift
//  MDBSocials
//
//  Created by Candace Chiang on 2/26/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit
import FirebaseAuth

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpBackground()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpNavbar()
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

}
