//
//  ViewController.swift
//  mapa
//
//  Created by Użytkownik Gość on 26.10.2016.
//  Copyright © 2016 Użytkownik Gość. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var StartButton: UIButton!
    @IBOutlet weak var StopButton: UIButton!
    @IBOutlet weak var ClearButton: UIButton!
    @IBOutlet weak var Map: MKMapView!
    var location: CLLocationManager!
    
    @IBAction func Start(sender: AnyObject) {
        StartButton.enabled = false
        StopButton.enabled = true
        location.startUpdatingLocation()
        Map.showsUserLocation = true

    }
    
    @IBAction func Stop(sender: AnyObject) {
        StopButton.enabled = false
        StartButton.enabled = true
        location.stopUpdatingLocation()
        Map.showsUserLocation = false
    }
    
    @IBAction func Clear(sender: AnyObject) {
        Map.removeAnnotations(Map.annotations)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StartButton.enabled = true
        StopButton.enabled = false
        ClearButton.enabled = true
        
        if (CLLocationManager.locationServicesEnabled()){
            location = CLLocationManager()
            location.delegate = self
            location.requestWhenInUseAuthorization()
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let currentLocation = locations.last?.coordinate
        
        let marker = MKPointAnnotation()
        
        marker.coordinate = currentLocation!
        Map.addAnnotation(marker)
        
        var spanDelta = 0.0
        
        if let speed = locations.last?.speed where speed > 0 {
            spanDelta = (locations.last?.speed)! / 6000
        }
        
        let locationArea = MKCoordinateRegion(center: currentLocation!, span: MKCoordinateSpan(latitudeDelta: spanDelta, longitudeDelta: spanDelta))
        Map.setRegion(locationArea, animated: true)
    }


}

