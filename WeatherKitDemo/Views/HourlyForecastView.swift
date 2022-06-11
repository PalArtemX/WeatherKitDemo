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
        VStack(alignment: .leading) {
            Text("Hourly Forecast")
                .font(.headline)
                .foregroundColor(.gray)
            
            
        }
    }
}










//struct HourlyForecastView_Previews: PreviewProvider {
//    static var previews: some View {
//        HourlyForecastView()
//    }
//}
