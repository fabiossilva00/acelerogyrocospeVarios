//
//  ProtocolsTesting.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 24/08/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

protocol NomeCompleto {
    var fullName: String { get }
}

struct Pessoa: NomeCompleto {
    var fullName: String {
        return "Nome Completo"
    }
}

protocol MetodosProtocols {
    func printAlgo()
    func printAlgoRetorna() -> String
    func printAlgoParametroRetorna(parametro: String) -> String
    func printAlgoParametro(parametro: String)
    static func printAlgoStatico(algoParametro: String...)
}

struct Prints {
    func printAlgo() {
        print("Print algo interressante")
    }
    
    func printAlgoRetorna() -> String {
        return "Retorna algo em String Print"
    }
    func printAlgoParametroRetorna(parametro: String) -> String {
        return parametro
    }
    
    func printAlgoParametro(parametro: String) {
        print(parametro)
    }
    
    static func printAlgoStatico(algoParametro: String...) {
        print(algoParametro)
    }
    
}


