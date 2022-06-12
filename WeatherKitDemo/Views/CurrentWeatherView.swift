//
//  CurrentWeatherView.swift
//  WeatherKitDemo
//
//  Created by Artem Paliutin on 10/06/2022.
//

import SwiftUI
import WeatherKit
import CoreLocation


struct CurrentWeatherView: View {
    let weather: Weather
    
    
    var body: some View {
        VStack {
            // MARK: - Header
            Text(weather.currentWeather.temperature.converted(to: .celsius).formatted())
                .font(.largeTitle)
                .foregroundColor(.white)
            
            
//            ScrollView(.horizontal) {
//                
//                HStack {
//                    ForEach(weather.hourlyForecast.forecast, id: \.date) { item in
//                        VStack {
//                            Text("\(item.temperature.formatted())")
//                                .foregroundColor(.blue)
//                            Text("\(item.date.formatted(date: .omitted, time: .standard))")
//                        }
//                    }
//                }
//            }
            
        }
    }
}










//struct CurrentWeatherView_Previews: PreviewProvider {
//    static var previews: some View {
//        CurrentWeatherView(weather: )
//    }
//}
