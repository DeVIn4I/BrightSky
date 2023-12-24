//
//  WeatherManager.swift
//  BrightSky
//
//  Created by Razumov Pavel on 22.12.2023.
//

import Foundation
import WeatherKit
import CoreLocation

final class WeatherManager {
    static let shared = WeatherManager()
    
    let service = WeatherService.shared
    
    
    private init() {}
    
    public private(set) var currentWeather: CurrentWeather?
    public private(set) var hourlyWeather: [HourWeather] = []
    public private(set) var dailytWeather: [DayWeather] = []
    
    public func getWeather(for location: CLLocation, completion: @escaping () -> Void) {
        Task {
            do {
                let result = try await service.weather(for: location)
                
                print("Current: \(result.currentWeather)")
                print("Hourly: \(result.hourlyForecast)")
                print("Daily: \(result.dailyForecast)")
                
                self.currentWeather = result.currentWeather
                self.hourlyWeather = result.hourlyForecast.forecast
                self.dailytWeather = result.dailyForecast.forecast
                
                completion()
            } catch {
                print(String(describing: error))
            }
        }
        
    }
}
