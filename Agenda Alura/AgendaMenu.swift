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
}

class AgendaMenu: NSObject {
    
    func configuraMenu(completion: @escaping (_ menuAction: menuAction ) ->Void ) -> UIAlertController {
        
        let alertController = UIAlertController(title: "Escolha uma opcao", message: "", preferredStyle: .actionSheet)
        let smsButton = UIAlertAction(title: "SMS", style: .default) { (acao) in
            completion(.smsButton)
            
        }
        let cancelButton = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alertController.addAction(smsButton)
        alertController.addAction(cancelButton)
     
        return alertController
    }

}
