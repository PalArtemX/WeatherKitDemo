//
//  HourlyForecastView.swift
//  WeatherKitDemo
//
//  Created by Artem Paliutin on 11/06/2022.
//

import SwiftUI
import WeatherKit


struct HourlyForecastView: View {
    let hourWeatherList: [HourWeather]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            // MARK: - header
            Text("Hourly Forecast")
                .font(.caption)
                .foregroundColor(.white.opacity(0.5))
            
            // MARK: - HourWeatherList
            ScrollView(.horizontal) {
            
                HStack {
                    ForEach(hourWeatherList, id: \.date) { hourWeather in
                        VStack(spacing: 15) {
                            Text(hourWeather.date.formatAsAbbreviatedTime())
                                .font(.caption2)
                            Image(systemName: "\(hourWeather.symbolName)")
                                .symbolRenderingMode(.hierarchical)
                                .foregroundColor(.yellow)
                                .font(.title2)
                            
                            Text(hourWeather.temperature.converted(to: .celsius).formatted())
                                .fontWeight(.medium)
                        }
                        .padding(.horizontal)
                    }
                }
                .foregroundColor(.white)
               
                
            }
           
        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}










//struct HourlyForecastView_Previews: PreviewProvider {
//    static var previews: some View {
//        HourlyForecastView()
//    }
//}
