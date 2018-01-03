//
//  Teste.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 02/01/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

class Teste: NSObject {
    
    func retornaTestes() -> Array<ItensTable> {
        
        let teste1 = ItensTable(testado: "Teste 1", testeB: "5", testeC: "Teste A", testeImage: "img1.png" )
        
        let teste2 = ItensTable(testado: "Teste 2", testeB: "4", testeC: "Teste B", testeImage: "img2.png" )
        
        let teste3 = ItensTable(testado: "Teste 3", testeB: "3", testeC: "Teste C", testeImage: "img3.png" )
        
        let teste4 = ItensTable(testado: "Teste 4", testeB: "2", testeC: "Teste D", testeImage: "img4.png" )
        
        let teste5 = ItensTable(testado: "Teste 5", testeB: "1", testeC: "Teste E", testeImage: "img5.png" )
        
        let lista:Array<ItensTable> = [teste1, teste2, teste3, teste4, teste5]
        
        return lista
        
    }

}
