//
//  ViewController.swift
//  Laba2
//
//  Created by Илья Волынец on 15.11.21.
//

import UIKit

class ViewController: UIViewController {

    let defaults = UserDefaults.standard
    
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var feellikeLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
   
    @IBOutlet weak var weatherSearchBar: UISearchBar!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        weatherSearchBar.delegate = self
       
        
    }

    @IBAction func addButton(_ sender: UIButton) {
        
        
        let namecity = cityLabel.text!
        let temperature = temperatureLabel.text!
        let felllike = feellikeLabel.text!
        let humidity = humidityLabel.text!
        
        Base.shared.saveWeather(nameCity: namecity, temp: temperature, feeltemp: felllike,vlaj: humidity)
        
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (touches.first) != nil{
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
        
}
    

extension ViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
        
        
        let urlString = "https://api.weatherapi.com/v1/current.json?key=063a9294bb3548148f4185429211001&q=\(searchBar.text!)"
        
        
        var locationName : String?
        var temperature : Double?
        var feelLikeTemp : Double?
        var humidity : Double?
        
        guard let url = URL(string: urlString) else {return}
        let task = URLSession.shared.dataTask(with : url) { (data, response, error) in
            do{
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String : AnyObject]
                
                if let location = json["location"]{
                    locationName = location["name"] as? String
                }
                    
                if let current = json["current"]{
                    temperature = current["temp_c"] as? Double
                }
                
               
                if let current = json["current"]{
                    feelLikeTemp = current["feelslike_c"] as? Double
                }
                
                if let current = json["current"]{
                    humidity = current["humidity"] as? Double
                }
            
                DispatchQueue.main.async {
                    
                    if locationName != nil{
                    self.cityLabel.text = locationName
                    }
                    if temperature != nil{
                        self.temperatureLabel.text = "Температура: " + "\(temperature!)" + "С°"
                    }
                    if feelLikeTemp != nil{
                    self.feellikeLabel.text = "Ощущается как: " + "\(feelLikeTemp!)" + "С°"
                    }
                    if humidity != nil{
                    self.humidityLabel.text = "Влажность: " + "\(humidity!)" + "%"
                    }
                }
                
            }
            catch let jsonError{
                print(jsonError)
            
            }
        }
        
        task.resume()
        
    }
}
