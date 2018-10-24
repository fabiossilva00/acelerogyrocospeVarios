//
//  ProtocolsTestingsExtensionFunctions.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 24/08/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import Foundation

extension ProtocolTestsViewController: MetodosProtocols {
    
    func printAlgo() {
    }
    
    func printAlgoRetorna() -> String {
        return "Algo"
    }
    
    func printAlgoParametroRetorna(parametro: String) -> String {
        return parametro
    }
    
    func printAlgoParametro(parametro: String) {
        print(parametro)
    }
    
    class func printAlgoStatico(algoParametro: String...) {
        print(algoParametro)
    }
    
    
}
