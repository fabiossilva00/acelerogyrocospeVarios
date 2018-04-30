//
//  AlamoCampos.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 15/01/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

class AlamoCampos: NSObject {
    
    var logradouro = ""
    var bairro = ""
    var cidade = ""
    var estado = ""
    
    init(_ dictionaryAPI: Dictionary<String, String>){
        logradouro = dictionaryAPI["logradouro"] ?? ""
        bairro = dictionaryAPI["bairro"] ?? ""
        cidade = dictionaryAPI["localidade"] ?? ""
        estado = dictionaryAPI["uf"] ?? ""
    
    }
    
    class func alamoDados(dictiAPI: Dictionary<String, String>) -> AlamoCampos {
        let dadosAPI = AlamoCampos(dictiAPI)
        
        return dadosAPI
    }

}



