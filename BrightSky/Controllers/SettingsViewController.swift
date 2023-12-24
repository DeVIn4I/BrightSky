//
//  SettingsViewController.swift
//  BrightSky
//
//  Created by Razumov Pavel on 22.12.2023.
//

import UIKit

class SettingsViewController: UIViewController {
        
    private let primaryView: SettingsView = {
        let view = SettingsView()
        let viewModel = SettingsViewViewModel(option: SettingOption.allCases)
        view.configure(with: viewModel)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        primaryView.delegate = self
        setUpView()
    }
 
    private func setUpView() {
        view.backgroundColor = .systemBackground
        view.addSubview(primaryView)
        
        NSLayoutConstraint.activate([
            primaryView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            primaryView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            primaryView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            primaryView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

extension SettingsViewController: SettingsViewDelegate {
    func settingsView(_ settingsView: SettingsView, didTap option: SettingOption) {
        switch option {
        case .upgrade:
            break
        case .privacyPolicy:
            break
        case .terms:
            break
        case .contact:
            break
        case .getHelp:
            break
        case .rateApp:
            break
        }
    }
    
    
}
