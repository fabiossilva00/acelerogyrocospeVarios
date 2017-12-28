//
//  Maps2ViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 27/12/2017.
//  Copyright © 2017 Fabio Sousa da Silva. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class Maps2ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var pinTabs: [PinTabs] = []
    
    var locationManager = CLLocationManager()
    
    @IBAction func voltarButton(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "buttonTelasID")
        self.present(vc, animated: true, completion: nil)
    }
    
    func loadInitialData() {
        guard let fileName = Bundle.main.path(forResource: "PublicArt", ofType: "json") else {return}
        let optionalData = try? Data(contentsOf: URL(fileURLWithPath: fileName))
        
        guard let data = optionalData,
            let json = try? JSONSerialization.jsonObject(with: data),
            let dictionary = json as? [String: Any],
            let works = dictionary["data"] as? [[Any]]
            else {return}
        let valid = works.flatMap { PinTabs(json: $0) }
        pinTabs.append(contentsOf: valid)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        
        loadInitialData()
        mapView.addAnnotations(pinTabs)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        checkLocationAuthorizationStatus()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestLocation()
    
    }
    
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedAlways {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestAlwaysAuthorization()
        }
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            print(location.coordinate.latitude)
            print(location.coordinate.longitude)
            let span = MKCoordinateSpanMake(0.01, 0.01)
            let region = MKCoordinateRegionMake(location.coordinate, span)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(Error.self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension Maps2ViewController: MKMapViewDelegate{
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? PinTabs else {return nil}
        let identifier  =  "Marca"
        var view: MKMarkerAnnotationView
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        }else{
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
}
