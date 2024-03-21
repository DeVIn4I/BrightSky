//
//  AlertModel.swift
//  BrightSky
//
//  Created by Razumov Pavel on 21.03.2024.
//

import UIKit

struct AlertModel {
    let title: String?
    let message: String?
    let style: UIAlertController.Style
    let actions: [UIAlertAction]
    
    init(
        title: String? = nil,
        message: String? = nil,
        style: UIAlertController.Style = .alert,
        actions: [UIAlertAction] = [UIAlertAction(title: "OK", style: .default)]
    ) {
        self.title = title
        self.message = message
        self.style = style
        self.actions = actions
    }
}

