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
            Text("Weather")
                .fontWeight(.semibold)
            
            Text(weather.currentWeather.temperature.converted(to: .celsius).formatted())
                        
        }
        .font(.title2)
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .background(.ultraThinMaterial)
        .cornerRadius(15)
        .padding(.horizontal)
    }
}










//struct CurrentWeatherView_Previews: PreviewProvider {
//    static var previews: some View {
//        CurrentWeatherView(weather: )
//    }
//}
