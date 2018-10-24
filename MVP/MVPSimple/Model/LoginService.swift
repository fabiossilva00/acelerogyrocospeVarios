//
//  LoginService.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 29/08/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import Foundation
import Alamofire

class LoginService: LoginEmail {
    
    func entrarEmail(parameters: Login, completionHandler: @escaping entrarEmailCompletionHandler) {
        
        guard let urlRequest = URL(string: "http://www.zazzi.com.br:3005/auth") else { return }
        
        let parameters: Parameters=["email": parameters.email, "senha": parameters.senha]
        
        Alamofire.request(urlRequest, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseJSON() { response in
            
            completionHandler(response.result)
        
        }
        
    }
    
}
