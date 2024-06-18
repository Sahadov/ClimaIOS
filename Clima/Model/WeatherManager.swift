//
//  WeatherManager.swift
//  Clima
//
//  Created by Дмитрий Волков on 18.06.2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=6ff66bdc8a6486976690e302c0c398d4&units=metric"
   
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
    }
    
}
