//
//  WeatherManager.swift
//  BrightSky
//
//  Created by Razumov Pavel on 22.12.2023.
//

import UIKit
import WeatherKit
import CoreLocation

enum WeatherError: Error {
    case locationError
    case weatherDataError
    case cityNotFound
}

final class WeatherManager {
    static let shared = WeatherManager()
    
    let service = WeatherService.shared
    
    private init() {}
    
    //MARK: - Properties
    public private(set) var currentWeather: CurrentWeather?
    public private(set) var hourlyWeather: [HourWeather] = []
    public private(set) var dailyWeather: [DayWeather] = []
    public private(set) var cityName: String?
    
     //MARK: - Methods
    public func getWeather(for location: CLLocation, completion: @escaping (Result<Void, WeatherError>) -> Void) {
        Task {
            do {
                let result = try await service.weather(for: location)
                self.currentWeather = result.currentWeather
                self.hourlyWeather = Array(result.hourlyForecast.forecast.prefix(24))
                self.dailyWeather = Array(result.dailyForecast.forecast.prefix(7))
                
                let geoCoder = CLGeocoder()
                let placeMarks = try await geoCoder.reverseGeocodeLocation(location)
                if let place = placeMarks.first, let city = place.locality {
                    self.cityName = city
                }
                completion(.success(()))
            } catch {
                completion(.failure(.weatherDataError))
            }
        }
    }
    
    public func getWeather(forCity cityName: String, completion: @escaping (Result<Void, WeatherError>) -> Void) {
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(cityName) { [weak self] placeMarks, error in
            guard let self = self,
                  let location = placeMarks?.first?.location
            else {
                completion(.failure(.cityNotFound))
                return
            }
            self.getWeather(for: location, completion: completion)
        }
    }
}

