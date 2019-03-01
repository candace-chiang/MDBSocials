//
//  TableViewCell.swift
//  MDBSocials
//
//  Created by Candace Chiang on 2/26/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var picture: UIImageView!
    
    var nameLabel: UILabel!
    var descLabel: UILabel!
    var hostLabel: UILabel!
    
    var numberLabel: UILabel!
    var interestLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func initCellFrom(size: CGSize) {
        contentView.backgroundColor = UIColor(hexString: "#2ECCFA")
        picture = UIImageView(frame: CGRect(x: 0, y: 0, width: size.width/3, height: size.height))
        picture.contentMode = .scaleAspectFit
        contentView.addSubview(picture)
        
        nameLabel = UILabel(frame: CGRect(x: picture.frame.maxX, y: size.height/10, width: size.width/2, height: size.height/5))
        nameLabel.font = UIFont(name: "SourceCodePro-Bold", size: 20)
        nameLabel.textColor = .white
        nameLabel.textAlignment = .center
        nameLabel.adjustsFontSizeToFitWidth = true
        contentView.addSubview(nameLabel)
        
        hostLabel = UILabel(frame: CGRect(x: picture.frame.maxX, y: nameLabel.frame.maxY, width: size.width/2, height: size.height/7))
        hostLabel.font = UIFont(name: "SourceCodePro-Regular", size: 15)
        hostLabel.textColor = .white
        hostLabel.textAlignment = .center
        hostLabel.adjustsFontSizeToFitWidth = true
        contentView.addSubview(hostLabel)
        
        /*
        descLabel = UILabel(frame: CGRect(x: picture.frame.maxX + size.width/40, y: hostLabel.frame.maxY, width: size.width/2, height: size.height/4))
        descLabel.font = UIFont(name: "SourceSansPro-Regular", size: 15)
        descLabel.textColor = .white
        descLabel.numberOfLines = 0
        descLabel.lineBreakMode = .byWordWrapping
        contentView.addSubview(descLabel)
        */
        
        numberLabel = UILabel(frame: CGRect(x: picture.frame.maxX + size.width/50, y: hostLabel.frame.maxY + size.height/30, width: size.width/20, height: size.height/6))
        numberLabel.font = UIFont(name: "SourceCodePro-Bold", size: 16)
        numberLabel.textColor = UIColor(hexString: "#F4F12B")
        contentView.addSubview(numberLabel)
        
        interestLabel = UILabel(frame: CGRect(x: numberLabel.frame.maxX, y: hostLabel.frame.maxY + size.height/30, width: size.width/2, height: size.height/6))
        interestLabel.font = UIFont(name: "SourceCodePro-Regular", size: 16)
        interestLabel.textColor = .white
        interestLabel.text = "people interested!"
        contentView.addSubview(interestLabel)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
