//
//  UIViewController+Extensions.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 Nytapp. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showWarningDialog(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let submitAction = UIAlertAction(title: "Ok", style: .default) { action in
            alertController.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(submitAction)
        present(alertController, animated: true, completion: nil)
    }
    
}
