//
//  HourlyForecastChartView.swift
//  WeatherKitDemo
//
//  Created by Artem Paliutin on 12/06/2022.
//

import SwiftUI
import Charts
import WeatherKit


struct HourlyForecastChartView: View {
    let hourlyWeatherDate: [HourWeather]
    
    var body: some View {
        Chart {
            ForEach(hourlyWeatherDate.prefix(10), id: \.date) { hourlyWeather in
                BarMark(
                    x: .value("Hour", hourlyWeather.date.formatAsAbbreviatedTime()),
                    y: .value("Temperature", hourlyWeather.temperature.converted(to: .fahrenheit).value))
                
            }
            
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(15)
    }
}










//struct HourlyForecastChartView_Previews: PreviewProvider {
//    static var previews: some View {
//        HourlyForecastChartView()
//    }
//}
