//
//  EmailPresenter.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 30/08/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import Foundation

protocol LoginPresenter {
    func entrarButton(parameters: Login)
    
}

class LoginPresenterImplementation: LoginPresenter {
    
   func entrarButton(parameters: Login) {
    
        LoginService().entrarEmail(parameters: parameters, completionHandler: { response in
            print(response)
            
        })
    }
    
}
