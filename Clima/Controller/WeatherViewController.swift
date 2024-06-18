//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    
    var weatherManger = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.delegate = self
    }

    @IBAction func serchPressed(_ sender: UIButton) {
        // закрывает клавиатуру
        searchTextField.endEditing(true)
        print(searchTextField.text!)
    }
    
    // действия после нажатия go
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type the city"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text {
            weatherManger.fetchWeather(cityName: city)
        }
        searchTextField.text = ""
    }
}

