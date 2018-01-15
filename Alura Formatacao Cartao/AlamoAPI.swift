//
//  AlamoAPI.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 15/01/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit
import Alamofire

class AlamoAPI: NSObject {
    
//    https://viacep.com.br/ws/cepURL/json/
    
    func alamoAPI(cep: String, sucess:@escaping(_ localizacao: AlamoCampos) -> Void, failure:@escaping(_ error: Error) -> Void ){
        
        let cepURL = "https://viacep.com.br/ws/\(cep)/json/"
        
        Alamofire.request(cepURL).validate().responseJSON(){ response in
            switch response.result{
            case .success:
                if let respostaAPI = response.result.value as? Dictionary<String, String> {
                    
                    sucess(AlamoCampos(respostaAPI))
                    
//                    let json = respostaAPI as! NSDictionary
//                    let logradoutro = json.value(forKey: "logradouro")
                }
                
                break
            case .failure:
                failure(response.error!)
                
                break
            }
        }
    }
    
    
}
