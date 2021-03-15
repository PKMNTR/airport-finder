//
//  SystemAlertHelper.swift
//  airport-finder
//
//  Created by Ricardo Ramirez on 11/03/21.
//

import UIKit

class SystemAlertHelper {
    
    public class func createInformativeAlert(title: String, message: String, buttonTitle: String, completion: (() -> Void)?) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(
            UIAlertAction(
                title: buttonTitle,
                style: .default
            ) { (action) in
                if let completionBlock = completion {
                    completionBlock()
                }
            }
        )
        return alert
    }
    
}

