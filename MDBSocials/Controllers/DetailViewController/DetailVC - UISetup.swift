//
//  DetailVC - UISetup.swift
//  MDBSocials
//
//  Created by Candace Chiang on 2/28/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit

extension DetailViewController {
    func setUpBackground() {
        view.backgroundColor = UIColor(hexString: "#2ECCFA")
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width * 4/5, height: view.frame.height/4))
        imageView.center = CGPoint(x: view.frame.width/2, y: view.frame.height/7)
        imageView.image = event.image
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
    }
    
    func setUpNavbar() {
        self.navigationController!.isNavigationBarHidden = false
        self.navigationItem.hidesBackButton = false
        self.navigationController!.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        self.navigationController!.navigationBar.barTintColor = UIColor(hexString: "#2ECCFA")
        self.navigationController!.navigationBar.tintColor = .white
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
    
    func setUpLabels() {
        nameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width * 4/5, height: view.frame.height/15))
        nameLabel.center = CGPoint(x: view.frame.width/2, y: imageView.frame.maxY + view.frame.height/20)
        nameLabel.font = UIFont(name: "SourceCodePro-Bold", size: 32)
        nameLabel.text = event.title
        nameLabel.textColor = .white
        nameLabel.textAlignment = .center
        nameLabel.backgroundColor = UIColor(hexString: "#2ECCFA")
        nameLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(nameLabel)
        
        dateLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width * 4/5, height: view.frame.height/15))
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateStyle = .none
        timeFormatter.timeStyle = .short
        timeFormatter.locale = Locale(identifier: "en_US")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "en_US")
        
        dateLabel.center = CGPoint(x: view.frame.width/2, y: nameLabel.frame.maxY + view.frame.height/50)
        dateLabel.font = UIFont(name: "SourceCodePro-Regular", size: 28)
        dateLabel.text = dateFormatter.string(from: event.date) + " @ " + timeFormatter.string(from: event.date)
        dateLabel.textColor = UIColor(hexString: "#F4F12B")
        dateLabel.textAlignment = .center
        dateLabel.backgroundColor = UIColor(hexString: "#2ECCFA")
        dateLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(dateLabel)
        
        posterLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width * 4/5, height: view.frame.height/15))
        posterLabel.center = CGPoint(x: view.frame.width/2, y: dateLabel.frame.maxY + view.frame.height/20)
        posterLabel.font = UIFont(name: "SourceSansPro-Bold", size: 28)
        posterLabel.text = "by " + event.poster
        posterLabel.textColor = .white
        posterLabel.textAlignment = .center
        posterLabel.backgroundColor = UIColor(hexString: "#2ECCFA")
        posterLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(posterLabel)
        
        descLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width * 9/10, height: view.frame.height/8))
        descLabel.center = CGPoint(x: view.frame.width/2, y: posterLabel.frame.maxY + view.frame.height/10)
        descLabel.font = UIFont(name: "SourceSansPro-Regular", size: 22)
        descLabel.textColor = .white
        descLabel.textAlignment = .center
        descLabel.text = event.description
        descLabel.numberOfLines = 0
        descLabel.lineBreakMode = .byWordWrapping
        descLabel.backgroundColor = UIColor(hexString: "#2ECCFA")
        view.addSubview(descLabel)
    }
    
    func setUpInterest() {
        interestButton = UIButton(frame: CGRect(x: view.frame.width/10, y: view.frame.height * 3/4, width: view.frame.width/6, height: view.frame.height/15))
        interestButton.setImage(UIImage(named: "outline"), for: .normal)
        interestButton.setImage(UIImage(named: "star"), for: .selected)
        interestButton.imageView?.contentMode = .scaleAspectFit
        interestButton.addTarget(self, action: #selector(interested), for: .touchUpInside)
        view.addSubview(interestButton)
        
        numberLabel = UILabel(frame: CGRect(x: interestButton.frame.maxX + view.frame.width/30, y: interestButton.frame.minY, width: view.frame.width/15, height: view.frame.height/15))
        numberLabel.font = UIFont(name: "SourceCodePro-Bold", size: 24)
        numberLabel.text = "\(event.interested.count)"
        numberLabel.textColor = UIColor(hexString: "#F4F12B")
        view.addSubview(numberLabel)
        
        interestLabel = UILabel(frame: CGRect(x: numberLabel.frame.maxX, y: numberLabel.frame.minY, width: view.frame.width/2, height: view.frame.height/15))
        interestLabel.font = UIFont(name: "SourceCodePro-Regular", size: 18)
        interestLabel.textColor = .white
        interestLabel.text = "people interested!"
        view.addSubview(interestLabel)
    }
}
