//
//  TabViewController.swift
//  BrightSky
//
//  Created by Razumov Pavel on 22.12.2023.
//

import UIKit

class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let tab1 = WeatherViewController()
        tab1.title = "Weather"
        
        let tab2 = SettingsViewController()
        tab2.title = "Settings"
        
        let nav1 = UINavigationController(rootViewController: tab1)
        nav1.tabBarItem = UITabBarItem(title: "Weather", image: UIImage(systemName: "cloud.sun"), tag: 1)
        
        let nav2 = UINavigationController(rootViewController: tab2)
        nav2.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 2)


        self.setViewControllers([nav1, nav2], animated: true)
    }

}
