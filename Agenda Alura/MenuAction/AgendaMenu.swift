//
//  AgendaMenu.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 26/02/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

enum menuAction {
    case smsButton
    case ligaButton
    case wazeButton
    case mapButton
}

class AgendaMenu: NSObject {
    
    func configuraMenu(completion: @escaping (_ menuAction: menuAction ) ->Void ) -> UIAlertController {
        
        let alertController = UIAlertController(title: "Escolha uma opcao", message: "", preferredStyle: .actionSheet)
        let smsButton = UIAlertAction(title: "SMS", style: .default) { (acao) in
            completion(.smsButton)

        }
        let ligaButton = UIAlertAction(title: "Ligar", style: .default) { (acao) in
            completion(.ligaButton)
            
        }
        let wazeButton = UIAlertAction(title: "Waze", style: .default) { (acao) in
            completion(.wazeButton)
        }
        let mapButton = UIAlertAction(title: "Mapa", style: .default) { (acao) in
            completion(.mapButton)
        }
        
        let cancelButton = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alertController.addAction(smsButton)
        alertController.addAction(ligaButton)
        alertController.addAction(wazeButton)
        alertController.addAction(mapButton)
        alertController.addAction(cancelButton)
     
        return alertController
    }

}
