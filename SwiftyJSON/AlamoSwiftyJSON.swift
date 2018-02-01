//
//  AlamoSwiftyJSON.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 29/01/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AlamoSwiftyJSON: NSObject {
    
    func loginAPI(email: String, senha: String, sucess:@escaping (_ sucess: Any) -> Void, failure:@escaping (_ error: Any) -> Void){

        let login = URL(string: "http://192.168.15.17:3000/api/auth")

        let parameters: Parameters=["email": email, "senha": senha]

        Alamofire.request(login!, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseJSON(){ response in
            switch response.result{
            case .success(_):
                if let resposta = response.result.value {
                    let json = resposta as! NSDictionary
                    let erro = json.value(forKey: "error") as! Bool
                    if erro == false {
                        sucess(erro)
                        print(json)
                        
                        let jsonSwifty = JSON(json)
//                        sucess(jsonSwifty)
                        let dict: JSON = jsonSwifty
                        let rotinas = dict["usuario", "rotinas", 1, "dia_uso", "domingo"].int

                        sucess(rotinas)
    
//                        login.token = json.value(forKey: "token") as! String
//                        //User
//                        let usuario = json.value(forKey: "usuario") as! NSDictionary
//                        login.idUser = usuario.value(forKey: "id") as! String
//                        //Bilhete
//                        let bilhete_unico = usuario.value(forKey: "bilhete_unico") as! NSDictionary
//                        login.apelido = bilhete_unico.value(forKey: "apelido") as! String
//                        login.estudante = bilhete_unico.value(forKey: "estudante") as! Bool
//                        login.numeroBU = bilhete_unico.value(forKey: "numero") as! String
//                        let saldo = bilhete_unico.value(forKey: "saldo") as! NSNumber
//                        login.saldo = String(describing: saldo)
//                        //Rotinas
//                        if let rotinas = usuario.value(forKey: "rotinas") as? NSArray ?? nil {
//                            //Dias de Uso
//                            let dia_uso = rotinas.value(forKey: "dia_uso") as? NSArray ?? nil
//                            print(dia_uso)
//                            let domingo = dia_uso?.value(forKey: "domingo") as? NSArray
//                            print(domingo)
//                        }
                    }else{
                        if let message = json.value(forKey: "message"){
                            
                        }
                    }
                }
                break
            case .failure(_):
                failure(response.error!)
                
                break
            }
        }
    }
    

}
