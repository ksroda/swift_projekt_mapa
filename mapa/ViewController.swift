import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var StartButton: UIButton!
    @IBOutlet weak var StopButton: UIButton!
    @IBOutlet weak var ClearButton: UIButton!
    @IBOutlet weak var Map: MKMapView!
    var location: CLLocationManager!
    
    @IBAction func StartButtonPressed(sender: AnyObject) {
        StartButton.enabled = false
        StopButton.enabled = true
        location.startUpdatingLocation()
        Map.showsUserLocation = true

    }
    
    @IBAction func StopButtonPressed(sender: AnyObject) {
        StopButton.enabled = false
        StartButton.enabled = true
        location.stopUpdatingLocation()
        Map.showsUserLocation = false
    }
    
    @IBAction func ClearButtonPressed(sender: AnyObject) {
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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let currentLocation = locations.last?.coordinate
        
        let marker = MKPointAnnotation()
        
        marker.coordinate = currentLocation!
        Map.addAnnotation(marker)
        
        var spanDelta = 0.0
        
        if let speed = locations.last?.speed where speed > 0 {
            spanDelta = speed / 5000
        }
        
        let locationArea = MKCoordinateRegion(center: currentLocation!, span: MKCoordinateSpan(latitudeDelta: spanDelta, longitudeDelta: spanDelta))
        Map.setRegion(locationArea, animated: true)
    }


}

