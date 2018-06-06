//
//  API.swift
//  widgetAcce
//
//  Created by Fabio Sousa da Silva on 24/05/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit
import Alamofire

struct valor{
    static var nome = String()
    static var saldo = String()
}

class API: NSObject {
    
    class func getLogin(success: @escaping (_ success: String) -> Void, failure: @escaping (_ failure: String) -> Void){
        let login = URL(string: "http://35.231.134.219:3000/auth")
    
        let shareDefaults = UserDefaults.init(suiteName: "group.acelerogyrocospeShare")
        
        guard let email = shareDefaults?.value(forKey: "email") else { return }
        guard let senha = shareDefaults?.value(forKey: "senha") else { return }
        
        let parameters: Parameters=["email": email, "senha": senha]
        
        Alamofire.request(login!, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseJSON(){ response in
            print(response)
            switch response.result{
            case .success:
                if let respostaJSON = response.result.value as? [String: Any] {
                    let json = respostaJSON as NSDictionary
                    let usuario = json.value(forKey: "usuario") as! NSDictionary
                    let nome = usuario.value(forKey: "nome") as! String
                    let bilhete = usuario.value(forKey: "bilhete_unico") as! NSDictionary
                    let saldo = bilhete.value(forKey: "saldo") as! String
                    
                    valor.nome = nome
                    valor.saldo = saldo
                    shareDefaults?.set(saldo, forKey: "saldo")
                    success(saldo)
                    
                }
                
                break
            case .failure:
                print(response)
                valor.nome = "Falha na atualizacao do saldo"
                break
            }
        }
    }
    
}
