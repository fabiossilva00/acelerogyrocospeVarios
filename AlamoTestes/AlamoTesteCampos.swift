//
//  AlamoTesteCampos.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 23/01/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

class AlamoTesteCampos: NSObject {
    
    var apelido = ""
    var numero = ""
    var saldo = ""
    
    init(_ dictionaryAPI: Dictionary<String, String>){
        apelido = dictionaryAPI["apelido"] ?? ""
        numero = dictionaryAPI["numero_cartao"] ?? ""
        saldo = dictionaryAPI["user_saldo"] ?? ""
    }
    
    class func alamoDados(dictioAPI: Dictionary<String, String>) -> AlamoTesteCampos {
        let dadosAPI = AlamoTesteCampos(dictioAPI)
        
        return dadosAPI
    }
    
}
