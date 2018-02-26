//
//  AlamoCandidato.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 26/02/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit
import Alamofire

struct enviaCandidatos {
    
    static var nome: String?
    static var data: String?
    static var telefone: String?
    static var email: String?
    static var senha: String?
    static var double: Double?
    
}

class AlamoCandidato: NSObject {
    
    func candidatoPost(nome: String, data: String, telefone: String, email: String, senha: String, sucess: @escaping (_ sucess : Any) -> Void, failure: @escaping (_ failure: Any) -> Void) {
        
        let url = URL(string: "http://35.224.221.96:3000/api/teste/selecao")
        
        let parameters: Parameters=["nome": nome, "data_nascimento": data, "telefone": telefone, "email": email, "senha": senha]
        print("Parameters \(parameters)")
        Alamofire.request(url!, method: .post, parameters: parameters).validate().responseJSON { response in
            switch response.result {
            case .success(_):
                print("Sucess \(response)")
                if let resposta = response.result.value {
                    
                    let json = resposta as! NSDictionary
                    let double = json.value(forKey: "valor")
                    
                    print(double)
                    
                }
                
                break
            case .failure(_):
                print("Failure \(response)")
                failure("Error \(response.error!)")
                
                break
            }
            
            
        }
        
    }
    
}
