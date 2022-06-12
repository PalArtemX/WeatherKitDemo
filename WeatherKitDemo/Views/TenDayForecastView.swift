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
            Text("10-Day Forecast")
                .font(.caption)
                .foregroundColor(.white)
                .opacity(0.9)
                .padding(.horizontal)
            
            List(dayWeatherList, id: \.date) { dailyWeather in
                HStack {
                    Text(dailyWeather.date.formatAsAbbreviatedDay())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Image(systemName: "\(dailyWeather.symbolName)")
                        .foregroundColor(.yellow)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(dailyWeather.lowTemperature.converted(to: .celsius).formatted())
                        .frame(maxWidth: .infinity, alignment: .leading)
                   
                    Text(dailyWeather.highTemperature.converted(to: .celsius).formatted())
                        
                }
                .listRowBackground(Color.blue)
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
