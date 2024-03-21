//
//  UIViewController+Extension.swift
//  BrightSky
//
//  Created by Razumov Pavel on 21.03.2024.
//

import UIKit

extension UIViewController {
    func showAlert(using model: AlertModel) {
        let alertController = UIAlertController(title: model.title, message: model.message, preferredStyle: model.style)
        model.actions.forEach { action in
            alertController.addAction(action)
        }
        self.present(alertController, animated: true, completion: nil)
    }
}
