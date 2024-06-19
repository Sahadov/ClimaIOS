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
        performWeatherRequest(urlString: urlString)
    }
    
    func performWeatherRequest(urlString: String){
        // 1. Create a url
        if let url = URL(string: urlString) {
            
            // 2. Create a URLsession
            let session = URLSession(configuration: .default)
            
            // 3. Give the session a task
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                }
            }
            
            // 4. Start the task
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.name)
        } catch {
            print(error)
        }
    }
}
