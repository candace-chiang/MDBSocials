//
//  DetailViewController.swift
//  MDBSocials
//
//  Created by Candace Chiang on 2/28/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var event: Event!
    
    var imageView: UIImageView!
    var nameLabel: UILabel!
    var descLabel: UILabel!
    var posterLabel: UILabel!
    var dateLabel: UILabel!
    
    var interestButton: UIButton!
    var numberLabel: UILabel!
    var interestLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpBackground()
        setUpLabels()
        setUpInterest()
        // Do any additional setup after loading the view.
    }
}
