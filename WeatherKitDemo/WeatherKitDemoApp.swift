//
//  WeatherKitDemoApp.swift
//  WeatherKitDemo
//
//  Created by Artem Paliutin on 10/06/2022.
//

import SwiftUI

@main
struct WeatherKitDemoApp: App {
    @StateObject var weatherVM = WeatherVM()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(weatherVM)
        }
    }
}
