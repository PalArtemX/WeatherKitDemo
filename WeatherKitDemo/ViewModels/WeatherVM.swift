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
    @Published var wether: Weather?
    
    let locationManager = LocationManager()
    let weatherService = WeatherService.shared
    
    
    // MARK: Functions
    func taskWeather() async {
        do {
            if let location = locationManager.currentLocation {
                let wether = try await weatherService.weather(for: location)
                await MainActor.run {
                    self.wether = wether
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
