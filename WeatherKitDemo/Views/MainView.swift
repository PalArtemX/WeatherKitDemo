//
//  MainView.swift
//  WeatherKitDemo
//
//  Created by Artem Paliutin on 10/06/2022.
//

import SwiftUI
import WeatherKit


struct MainView: View {
    @EnvironmentObject var weatherVM: WeatherVM
    
    var hourlyWeatherData: [HourWeather] {
        if let weather = weatherVM.weather {
            return Array(weather.hourlyForecast.filter { hourlyWeather in
                return hourlyWeather.date.timeIntervalSince(Date()) >= 0
            }.prefix(24))
        } else {
            return []
        }
    }
    
    var body: some View {
        ZStack {
            Color.blue.opacity(0.7)
                .ignoresSafeArea()
            
            VStack {
                if let weather = weatherVM.weather {
                    VStack {
                        CurrentWeatherView(weather: weather)
                        
                        
                        HourlyForecastChartView(hourlyWeatherDate: hourlyWeatherData)
                            .frame(height: 200)
                            .padding(.horizontal)
                        
                        HourlyForecastView(hourWeatherList: hourlyWeatherData)
                            .padding()
                        
                        TenDayForecastView(dayWeatherList: weather.dailyForecast.forecast)
                    }
                }
            }
            .task(id: weatherVM.locationManager.currentLocation) {
                await weatherVM.taskGetWeather()
            }
        }
    }
}










struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(WeatherVM())
    }
}
