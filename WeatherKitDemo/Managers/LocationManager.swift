//
//  LocationManager.swift
//  WeatherKitDemo
//
//  Created by Artem Paliutin on 10/06/2022.
//

import Foundation
import CoreLocation


class LocationManager: NSObject, ObservableObject {
    @Published var currentLocation: CLLocation?
    
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
    }
    
    
}





// MARK: - Extension LocationManager
extension LocationManager: CLLocationManagerDelegate {

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last, currentLocation == nil else { return }
        
        DispatchQueue.main.async {
            self.currentLocation = location
            print("✅ Get Current Location")
        }
    }
}
