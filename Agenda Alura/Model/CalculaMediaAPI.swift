//
//  CalculaMediaAPI.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 04/06/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

class CalculaMediaAPI: NSObject {
    
    func mediaGeral(){
        
        guard let urlRequest = URL(string: "https://www.caelum.com.br/mobile") else { return }
        
        var listAlunos: Array<Dictionary<String, Any>> = []
        
        var json: Dictionary<String, AnyObject> = [:]
        
        var dicAlunos = [
            "id": "1",
            "nome": "Nome",
            "endereco": "Rua",
            "telefone": "1111-1111",
            "site": "www.site.com",
            "nota": "8" ]
        
        listAlunos.append(dicAlunos as [String: Any])
        
        json = [
            "list": [
                "aluno": listAlunos
            ]
            ] as Dictionary<String, AnyObject>
        
        do {
            var request = URLRequest(url: urlRequest)
            let data = try JSONSerialization.data(withJSONObject: json, options: [])
            request.httpBody = data
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if error == nil {
                    
                    do {
                        let dicio = try JSONSerialization.jsonObject(with: data!, options: [])
                        
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
            task.resume()
        } catch {
            print(error.localizedDescription)
        }
        
    }

}
