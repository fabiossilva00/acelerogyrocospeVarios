//
//  AgendaMapViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 27/02/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit
import MapKit

class AgendaMapViewController: UIViewController {
    
    var agenda: AgendaDados?
    
    @IBOutlet weak var mapAgenda: MKMapView!
    
    func atualizaTela() {
        self.navigationItem.title = "Localiza"

    }
    
    func configPin(title: String, localizacaoPin: CLPlacemark) -> MKPointAnnotation {
        
        let pin = MKPointAnnotation()
        pin.title = title
        pin.coordinate = localizacaoPin.location!.coordinate
        
        return pin
    }
    
    func localIncial() {
        
        LocalizacaoWaze().convertForCoords(endereco: "Caelum - São Paulo", local: { (localizacao) in
            let pinMap = self.configPin(title: "Titulo", localizacaoPin: localizacao)
            let region = MKCoordinateRegionMakeWithDistance(pinMap.coordinate, 5000, 5000)
            self.mapAgenda.setRegion(region, animated: true)
            self.mapAgenda.addAnnotation(pinMap)
            
        })
        
    }
    
    func localAgenda() {
        
        if let agenda = agenda {
            print(agenda)
            LocalizacaoWaze().convertForCoords(endereco: agenda.endereco!, local: { (localizacaoEncontrada) in
                print(agenda.endereco!)
                let pino = self.configPin(title: agenda.nome!, localizacaoPin: localizacaoEncontrada)
                self.mapAgenda.addAnnotation(pino)
                
            })
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        atualizaTela()
        
        localIncial()
        localAgenda()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
