//
//  LocationManager.swift
//  BrightSky
//
//  Created by Razumov Pavel on 22.12.2023.
//

import Foundation
import CoreLocation

final class LocationManager: NSObject, CLLocationManagerDelegate {
    
    static let shared = LocationManager()
    
    private override init() {}
     //MARK: - Private Properties
    private let manager = CLLocationManager()
    private var locationFetchCompletion: ((CLLocation) -> Void)?
    private var location: CLLocation? {
        didSet {
            guard let location else { return }
            locationFetchCompletion?(location)
        }
    }
     //MARK: - Public Methods
    public func getCurrentLocation(completion: @escaping (CLLocation) -> Void) {
        self.locationFetchCompletion = completion
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.startUpdatingLocation()
    }
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        self.location = location
        manager.stopUpdatingLocation()
    }
}

