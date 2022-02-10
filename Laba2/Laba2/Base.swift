//
//  Base.swift
//  Laba2
//
//  Created by Илья Волынец on 17.11.21.
//

import Foundation

class Base{
    let defaults = UserDefaults.standard
    
    static let shared = Base()
    
    struct ArrayWeather: Codable{
    var nameCity:String?
        var temp:String?
        var feeltemp:String?
        var vlaj:String?
        var nam: String{
            return "\(nameCity ?? "")\n\(temp ?? "")\n\(feeltemp ?? "")\n\(vlaj ?? "")"
        }
    }
    
    var weathers:[ArrayWeather]{
        get{
            
            if let data = defaults.value(forKey: "weathers") as? Data{
                return try! PropertyListDecoder().decode([ArrayWeather].self, from: data)
            }else{
                return [ArrayWeather]()
            }
            
        }
        set{
            
            if let data = try? PropertyListEncoder().encode(newValue){
                defaults.set(data, forKey: "weathers")
            
        }
    }
    
    
 
    }
    
    func saveWeather(nameCity: String? ,temp: String?,feeltemp: String?,vlaj: String? ){
        let weather = ArrayWeather(nameCity: nameCity, temp: temp, feeltemp: feeltemp, vlaj: vlaj)
        weathers.insert(weather, at: 0)
    }
    
}
