//
//  WeatherVM.swift
//  WeatherKitDemo
//
//  Created by Artem Paliutin on 10/06/2022.
//

import Foundation
import CoreLocation
import WeatherKit


class WeatherVM: ObservableObject {
    @Published var weather: Weather?
    
    let locationManager = LocationManager()
    private let weatherService = WeatherService.shared
    private let locationByDefault = CLLocation(latitude: 24.206890, longitude: 18.711216)
    
    
    // MARK: Functions
    func taskGetWeather() async {
        do {
            if let location = locationManager.currentLocation {
                let wether = try await weatherService.weather(for: location)
                await MainActor.run {
                    self.weather = wether
                }
                print("✅ Current Location")
            } else {
                let wether = try await weatherService.weather(for: locationByDefault)
                await MainActor.run {
                    self.weather = wether
                }
                print("⚠️ Location By Default")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
