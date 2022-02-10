//
//  AboutViewController.swift
//  Laba2
//
//  Created by Илья Волынец on 18.11.21.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

class AboutViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupmanager()
        
    }
    
    func setupmanager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        mapView.showsUserLocation = true
        locationManager.startUpdatingLocation()
        locationManager.requestWhenInUseAuthorization()
    }
}
extension AboutViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last?.coordinate{
            let region = MKCoordinateRegion(center: location, latitudinalMeters: 2000, longitudinalMeters: 2000)
            mapView.setRegion(region, animated: true)
        }
    }
     
}
