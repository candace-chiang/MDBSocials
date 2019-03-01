//
//  FeedVC - UISetup.swift
//  MDBSocials
//
//  Created by Candace Chiang on 2/26/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit

extension FeedViewController {
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
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont(name: "SourceSansPro-Regular", size: 21)!, NSAttributedStringKey.foregroundColor: UIColor.white]
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createEvent))
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Log out", style: .done, target: self, action: #selector(logOut))
        self.navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSAttributedStringKey.font: UIFont(name: "SourceSansPro-Regular", size: 21)!], for: .normal)
    }
    
    func setUpTable() {
        tableView = UITableView(frame: view.frame)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "tableCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.rowHeight = view.frame.height/6
        tableView.backgroundColor = UIColor(hexString: "#2ECCFA")
        tableView.contentInset = UIEdgeInsetsMake(0, 0, view.frame.height/10, 0)
        view.addSubview(tableView)
    }
}
