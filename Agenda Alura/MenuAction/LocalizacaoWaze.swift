//
//  LocalizacaoWaze.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 27/02/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit
import CoreLocation

class LocalizacaoWaze: NSObject {
    
    func convertForCoords(endereco: String, local: @escaping(_ local: CLPlacemark) -> Void) {
        let conversor = CLGeocoder()
        conversor.geocodeAddressString(endereco) { (listaLocaliza, erro) in
            if let localiza = listaLocaliza?.first {
                local(localiza)
                
            }
        }
    }

}
