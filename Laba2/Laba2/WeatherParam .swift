//
//  WeatherParam .swift
//  Laba2
//
//  Created by Илья Волынец on 16.11.21.
//


import Foundation

class WeatherParam : NSObject {
    
    var locationName : String
    var temperature : Double
    var feelLikeTemp : Double
    var humidity : Double

    init(locationName: String, temperature : Double , feelLikeTemp : Double , humidity : Double) {
        
        self.locationName = locationName
        self.temperature = temperature
        self.feelLikeTemp = feelLikeTemp
        self.humidity = humidity
        
    }
    
    
   
}
