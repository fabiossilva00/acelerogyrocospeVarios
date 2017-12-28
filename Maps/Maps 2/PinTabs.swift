//
//  PinTabs.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 28/12/2017.
//  Copyright © 2017 Fabio Sousa da Silva. All rights reserved.
//

import UIKit
import MapKit

class PinTabs: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    let title: String?
    var locationName: String
    var discipline: String
    
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    var subtitle: String? {
        return locationName
    }
    
    init?(json: [Any]){
        self.title = json[16] as? String ?? "Sem Nada"
        self.locationName = json[12] as! String
        self.discipline = json[15] as! String
        
        if let latitude = Double(json[18] as! String), let longitude = Double(json[19] as! String){
            self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }else{
            self.coordinate = CLLocationCoordinate2D()
        }
        
    }
    
}
