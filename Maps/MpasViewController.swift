//
//  MpasViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 18/12/2017.
//  Copyright © 2017 Fabio Sousa da Silva. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

struct locationUser{
    static var latitude = Double()
    static var longitude = Double()
    static var region = MKCoordinateRegion()
}

class MpasViewController: UIViewController, UISearchBarDelegate{
    
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    var resultSearch : UISearchController!
    
    
    let searchTable = SearchTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
        locationManager.requestLocation()
  
        let localTable = storyboard!.instantiateViewController(withIdentifier: "tableID") as! SearchTableViewController
        resultSearch = UISearchController(searchResultsController: localTable)
        resultSearch.searchResultsUpdater = localTable
        
        let searchBar = resultSearch.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Teste SearchBar"
        //        searchBar.barStyle = .blackOpaque
        navigationItem.titleView = resultSearch.searchBar
        
        resultSearch.hidesNavigationBarDuringPresentation = false
        resultSearch.dimsBackgroundDuringPresentation  = true
        definesPresentationContext = true
               
//        localTable.mapViewS = mapView?
        
        mapView.mapType = .standard
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Verifica autorizado localizacao
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationAuthorizationStatus()
        
    }
    
    @IBAction func voltarButton(_ sender: Any) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "buttonTelasID")
        self.present(vc, animated: true, completion: nil)
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

extension MpasViewController: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        
        if let location = locations.first{
            print(location)
            let span = MKCoordinateSpanMake(0.01, 0.01)
            let region = MKCoordinateRegionMake(location.coordinate, span)
            mapView.setRegion(region, animated: true)
        }
        
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(Error.self)
    }
}

