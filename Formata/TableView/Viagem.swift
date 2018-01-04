//
//  Viagem.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 04/01/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

class Viagem: NSObject {
    
    let titulo: String
    let quantidadeDeDias: Int
    let preco: String
    let caminhoDaImagem: String
    
    init(titulo: String, quantidadeDeDias: Int, preco: String, caminhoDaImagem: String){
    
    self.titulo = titulo
    self.quantidadeDeDias = quantidadeDeDias
    self.preco = preco
    self.caminhoDaImagem = caminhoDaImagem
    
    }

}
