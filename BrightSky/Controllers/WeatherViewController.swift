//
//  WeatherViewController.swift
//  BrightSky
//
//  Created by Razumov Pavel on 22.12.2023.
//

import UIKit

class WeatherViewController: UIViewController {
    
    private let primaryView = CurrentWeatherView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        getLocation()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "crown"),
            style: .done,
            target: self,
            action: #selector(didTapUpgrade)
        )
    }

    private func getLocation() {
        LocationManager.shared.getCurrentLocation { location in
            WeatherManager.shared.getWeather(for: location) { [weak self] in
                DispatchQueue.main.async {
                    guard let currentWeather = WeatherManager.shared.currentWeather else { return }
                    self?.primaryView.configure(with: [
                        .current(viewModel: .init(model: currentWeather)),
                        .hourly(viewModels: WeatherManager.shared.hourlyWeather.compactMap({ .init(model: $0) })),
                        .daily(viewModels: WeatherManager.shared.dailytWeather.compactMap({ .init(model: $0) }))
                    ])
                }
            }
        }
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
    
    @objc
    private func didTapUpgrade() {
        
    }
}

