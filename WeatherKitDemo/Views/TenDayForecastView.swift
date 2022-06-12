//
//  TenDayForecastView.swift
//  WeatherKitDemo
//
//  Created by Artem Paliutin on 12/06/2022.
//

import SwiftUI
import WeatherKit

struct TenDayForecastView: View {
    let dayWeatherList: [DayWeather]
    
    var body: some View {
        VStack(alignment: .leading) {
            // MARK: - Header
            HStack {
                Text("10-Day Forecast")
                Spacer()
                Spacer()
                Text("Min")
                Spacer()
                Text("Max")
            }
            .font(.caption)
            .foregroundColor(.white)
            .opacity(0.9)
            .padding(.horizontal)
            
            // MARK: - List dayWeatherList
            List(dayWeatherList, id: \.date) { dailyWeather in
                HStack(spacing: 20.0) {
                    Text(dailyWeather.date.formatAsAbbreviatedDay())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Image(systemName: "\(dailyWeather.symbolName)")
                    
                    Spacer()
                    Spacer()
                    
                    Text(dailyWeather.lowTemperature.converted(to: .celsius).formatted())
                    
                    Spacer()
                    
                    Text(dailyWeather.highTemperature.converted(to: .celsius).formatted())
                }
                .listRowBackground(Color.blue.opacity(0.7))
                .foregroundColor(.white)
            }
            .listStyle(.plain)
        }
    }
}










//struct TenDayForecastView_Previews: PreviewProvider {
//    static var previews: some View {
//        TenDayForecastView()
//    }
//}
