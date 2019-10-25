//
//  ViewController.swift
//  Pockemon
//
//  Created by Asser on 7/15/19.
//  Copyright © 2019 Asser. All rights reserved.
//

import UIKit
import GoogleMaps


class ViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {
    
    var mapView : GMSMapView!
    let locationManager = CLLocationManager()
    var camera : GMSCameraPosition?
    var pockemonsList = [Pockemons]()
    let myMarker = GMSMarker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        camera = GMSCameraPosition.camera(withLatitude: 30 , longitude: 31, zoom: 10)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera!)
        self.view = mapView
        
       
        
        //Location
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            locationManager.requestWhenInUseAuthorization()
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }

    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[locations.count-1]
        if location.horizontalAccuracy > 0 {
          //locationManager.stopUpdatingLocation()
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            self.mapView.camera = GMSCameraPosition.camera(withLatitude: latitude , longitude: longitude, zoom: 15)
            
            //Setting The Marker
            
            myMarker.title = "Me"
            myMarker.snippet = "Here is my location"
            myMarker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            //myMarker.icon = UIImage(named: "Mario")
           
            let imageView = UIImageView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
            imageView.image = UIImage(named: "Mario")
            myMarker.iconView = imageView
            myMarker.map = self.mapView
            loadPockemons(latitude: latitude, longitude: longitude)
            
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    func showPockemons(){
        for pockemon in pockemonsList{
            let myMarker = GMSMarker()
            myMarker.title = pockemon.name!
            myMarker.snippet = "\(pockemon.details!) with power of : \(pockemon.power!)"
            myMarker.position = CLLocationCoordinate2D(latitude: pockemon.latitude!, longitude: pockemon.longitude!)
            //myMarker.icon = UIImage(named: "Mario")
            
            let imageView = UIImageView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
            imageView.image = UIImage(named: pockemon.image!)
            myMarker.iconView = imageView
            myMarker.map = self.mapView
        }
    }
    
    func loadPockemons(latitude : Double,longitude : Double) {
       
        pockemonsList.append(Pockemons(name: "Charmander", power: 30, latitude: latitude+0.008, longitude: longitude+0.0015, details: "This pockemon lives in Japan", image: "Charmander"))
         pockemonsList.append(Pockemons(name: "Bulbasur", power: 30, latitude: latitude-0.006, longitude: longitude+0.002, details: "This pockemon lives in Egypt", image: "Bulbasur"))
         pockemonsList.append(Pockemons(name: "Squirtle", power: 30, latitude: latitude, longitude: longitude+0.005, details: "This pockemon lives in ASia", image: "Squirtle"))
        if pockemonsList.count <= 3{
            showPockemons()
        }
    }
}

