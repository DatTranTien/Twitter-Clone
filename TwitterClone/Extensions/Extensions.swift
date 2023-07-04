//
//  Extensions.swift
//  TwitterClone
//
//  Created by Admin on 04/07/2023.
//

import UIKit

extension UIApplication{
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
