//
//  MainView.swift
//  WeatherKitDemo
//
//  Created by Artem Paliutin on 10/06/2022.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var weatherVM: WeatherVM
    
    
    var body: some View {
        VStack {
            Text("Weather")
                .font(.largeTitle)
                .foregroundColor(.blue)
            
            if let weather = weatherVM.weather {
                VStack(spacing: 50.0) {
                    CurrentWeatherView(weather: weather)
                    HourlyForecastView(hourWeatherList: weather.hourlyForecast.forecast)
                    
                }
            }
            Spacer()
        }
        .task(id: weatherVM.locationManager.currentLocation) {
            await weatherVM.taskGetWeather()
        }
    }
}










struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(WeatherVM())
    }
}
