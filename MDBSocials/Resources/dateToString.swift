//
//  dateToString.swift
//  MDBSocials
//
//  Created by Candace Chiang on 2/28/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import Foundation

extension String {
    func toDate() -> Date
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss xxx"
        let date = dateFormatter.date(from: self)!
        return date
    }
}
