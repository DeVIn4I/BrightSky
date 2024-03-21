//
//  WeatherViewController.swift
//  BrightSky
//
//  Created by Razumov Pavel on 22.12.2023.
//

import UIKit

class WeatherViewController: UIViewController {
    
    private let primaryView = CurrentWeatherView()
    private let searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        getLocation()
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "location"),
            style: .done,
            target: self,
            action: #selector(didTapUpgrade)
        )
        navigationItem.titleView = searchBar
        searchBar.delegate = self
        searchBar.placeholder = "Название города"
    }
    
    private func getLocation() {
        LocationManager.shared.getCurrentLocation { location in
            WeatherManager.shared.getWeather(for: location) { [weak self] in
                DispatchQueue.main.async {
                    self?.updateUI()
                }
            }
        }
    }
    
    private func updateUI() {
        guard let currentWeather = WeatherManager.shared.currentWeather,
              let cityName = WeatherManager.shared.cityName
        else {
            return
        }
        self.primaryView.configure(with: [
            .current(viewModel: .init(model: currentWeather, cityName: cityName)),
            .hourly(viewModels: WeatherManager.shared.hourlyWeather.compactMap({ .init(model: $0) })),
            .daily(viewModels: WeatherManager.shared.dailyWeather.compactMap({ .init(model: $0) }))
        ])
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
        LocationManager.shared.getCurrentLocation { [weak self] location in
            WeatherManager.shared.getWeather(for: location) {
                DispatchQueue.main.async {
                    self?.updateUI()
                }
            }
        }
    }
}

extension WeatherViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard let cityName = searchBar.text,!cityName.isEmpty
        else {
            return
        }
        WeatherManager.shared.getWeather(forCity: cityName) { [weak self] in
            DispatchQueue.main.async {
                self?.updateUI()
            }
        }
    }
    
}
