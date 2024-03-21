//
//  WeatherViewController.swift
//  BrightSky
//
//  Created by Razumov Pavel on 22.12.2023.
//

import UIKit

final class WeatherViewController: UIViewController {
     //MARK: - Private Properties
    private let primaryView = CurrentWeatherView()
    private let searchBar = UISearchBar()
    
     //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        getLocation()
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "location"),
            style: .done,
            target: self,
            action: #selector(didTapCurrentLocationButton)
        )
        navigationItem.titleView = searchBar
        searchBar.delegate = self
        searchBar.placeholder = "Название города"
    }
     //MARK: - Private Methods
    private func getLocation() {
        LocationManager.shared.getCurrentLocation { [weak self] location in
            WeatherManager.shared.getWeather(for: location) { result in
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    switch result {
                    case .success():
                        updateUI()
                    case .failure( _):
                        let alertModel = AlertModel(
                            title: "Ошибка доступа",
                            message: "Не удалось получить данные. Проверьте соединение с интернетом",
                            style: .alert,
                            actions: [UIAlertAction(
                                title: "Повторить",
                                style: .default,
                                handler: { _ in
                                    self.getLocation()
                                }
                            )]
                        )
                        showAlert(using: alertModel)
                    }
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
     //MARK: - Private Objc Methods
    @objc
    private func didTapCurrentLocationButton() {
        getLocation()
    }
}

 //MARK: - WeatherViewController: UISearchBarDelegate
extension WeatherViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard let cityName = searchBar.text,!cityName.isEmpty
        else {
            return
        }
        WeatherManager.shared.getWeather(forCity: cityName) { [weak self] result in
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                switch result {
                case .success():
                    updateUI()
                    searchBar.text = nil
                case .failure( _):
                    let alertModel = AlertModel(
                        title: "Ошибка",
                        message: "Не удалось найти город c таким названием!",
                        style: .alert,
                        actions: [UIAlertAction(
                            title: "OK",
                            style: .default,
                            handler: { [weak self] _ in
                                self?.searchBar.text = nil
                            }
                        )]
                    )
                    showAlert(using: alertModel)
                }
            }
        }
    }
}
