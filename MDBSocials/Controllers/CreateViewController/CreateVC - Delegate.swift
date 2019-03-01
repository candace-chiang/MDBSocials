//
//  CreateVC - Delegate.swift
//  MDBSocials
//
//  Created by Candace Chiang on 3/1/19.
//  Copyright © 2019 Candace Chiang. All rights reserved.
//

import UIKit

extension CreateViewController: UITextViewDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = nil
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text == nil {
            textField.text = "Event Name"
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Event Description" {
            textView.text = nil
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Event Description"
        }
    }
}
