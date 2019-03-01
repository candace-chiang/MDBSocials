//
//  FeedVC - Table.swift
//  MDBSocials
//
//  Created by Candace Chiang on 2/26/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit

extension FeedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height/4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as! TableViewCell
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        cell.awakeFromNib()
        let size = CGSize(width: tableView.frame.width, height: view.frame.height/4)
        cell.initCellFrom(size: size)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let tableCell = cell as! TableViewCell
        let event = events[indexPath.row]
        
        let posterID = event.poster!
        /*var poster = ""
        ref.child("users").queryOrdered(byChild: "uid").queryEqual(toValue: posterID)
            .observe(.childAdded, with: { (snapshot) in
                let val = snapshot.value as? [String: Any] ?? [:]
                poster = val["uid"] as! String
            })*/
        
        tableCell.picture.image = event.image
        tableCell.nameLabel.text = event.title
        tableCell.hostLabel.text = "by " + event.poster
        //tableCell.descLabel.text = event.description
        tableCell.numberLabel.text = "\(event.interested.count)"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selected = events[indexPath.row]
        performSegue(withIdentifier: "toDetails", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
