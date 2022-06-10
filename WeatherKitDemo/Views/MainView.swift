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
            Text("Hello")
            
            if let weather = weatherVM.wether {
                VStack {
                    Text("NN")
                    Text("\(weatherVM.locationManager.currentLocation!)")
                        .font(.caption2)
                    Text("\(weather.currentWeather.temperature.formatted())")
                    Text("\(weather.currentWeather.date.formatted())")
                }
            }
        }
        .task(id: weatherVM.locationManager.currentLocation) {
            await weatherVM.taskWeather()
        }
    }
}










struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(WeatherVM())
    }
}
